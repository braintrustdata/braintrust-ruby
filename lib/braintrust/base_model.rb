# frozen_string_literal: true

module Braintrust
  # @!visibility private
  module Converter
    # Returns a value that conforms to `type`, if possible: either the given `value` if it
    # conforms, or otherwise a new one derived from `value`.
    def self.convert(type, value)
      # If `type.is_a?(Converter)`, `type` is instance of a class that mixes in
      # Converter, indicating that the type should define .convert on the class.
      # Covers most cases including models, enums, arrays.
      # If `type.include?(Converter)`, `type` is a class that mixes in Converter.
      # Currently Unknown and BooleanModel, because we don't make instances of
      # those, as they dont need to be parameterized (as e.g. enums do with
      # possible values).
      if type.is_a?(Converter) || type.include?(Converter)
        type.convert(value)
      # String, Integer, Float, NilClass, Hash.
      elsif type.is_a?(Class)
        if type == NilClass
          nil
        elsif type == Float && value.is_a?(Numeric)
          value.to_f
        elsif [Integer, String, Hash].include?(type)
          value
        else
          raise StandardError, "can't coerce #{value.class} to #{type}"
        end
      else
        raise StandardError, "can't coerce #{value.class} to #{type}"
      end
    end

    # Returns true iff the given `value` conforms to `type` (in the sense of OpenAPI types,
    # not necessarily Ruby types).
    def self.same_type?(type, value)
      if type.is_a?(Converter) || type.include?(Converter)
        type.same_type?(value)
      else
        value.is_a?(type)
      end
    end
  end

  # @!visibility private
  class Unknown
    include Converter

    def self.convert(value)
      value
    end

    def self.same_type?(value)
      true
    end
  end

  # Ruby has no Boolean class; this is something for models to refer to.
  class BooleanModel
    include Converter

    def self.convert(value)
      value
    end

    def self.same_type?(value)
      [true, false].include?(value)
    end
  end

  # A Symbol from among a specified list of options.
  class Enum
    include Converter

    # NB we don't do runtime validation, so `options` is just an FYI
    # for the reader.
    def initialize(*options)
      @options = options
    end

    def convert(value)
      if value.is_a?(String)
        value.to_sym
      else
        value
      end
    end

    def same_type?(value)
      options.include?(value)
    end
  end

  # Array of items of a given type.
  class ArrayOf
    include Converter

    def initialize(items_type_info)
      @items_type_fn = items_type_info.is_a?(Proc) ? items_type_info : -> { items_type_info }
    end

    def convert(value)
      items_type = @items_type_fn.call
      value.map { |item| Converter.convert(items_type, item) }
    end

    def same_type?(value)
      if value.is_a?(Array)
        items_type = @items_type_fn.call
        value.all? { |item| Converter.same_type?(items_type, item) }
      else
        false
      end
    end
  end

  class BaseModel
    include Converter

    # @!visibility private
    # Assumes superclass fields are totally defined before fields are accessed / defined on subclasses.
    def self.fields
      @fields ||= (self.superclass == BaseModel ? {} : self.superclass.fields.dup)
    end

    # @!visibility private
    def self.add_field(name_sym, type_info, mode)
      type_fn = type_info.is_a?(Proc) ? type_info : -> { type_info }
      fields[name_sym] = {type_fn: type_fn, mode: mode}

      define_method(name_sym) { @data[name_sym] }
      define_method("#{name_sym}=") { |val| @data[name_sym] = val }
    end

    # @!visibility private
    # NB `required` is just a signal to the reader. We don't do runtime validation anyway.
    def self.required(name_sym, type_info, mode = :rw)
      add_field(name_sym, type_info, mode)
    end

    # @!visibility private
    # NB `optional` is just a signal to the reader. We don't do runtime validation anyway.
    def self.optional(name_sym, type_info, mode = :rw)
      add_field(name_sym, type_info, mode)
    end

    # @!visibility private
    def self.convert(data)
      model = new
      model.convert(data)
      model
    end

    # @!visibility private
    def self.same_type?(value)
      value.is_a?(self)
    end

    # @!visibility private
    def initialize
      @data = {}
    end

    # @!visibility private
    def convert(data)
      # TODO: what if data isn't a hash?
      data.each do |field_name, value|
        next if value.nil?

        field = self.class.fields[field_name.to_sym]
        if field
          next if field[:mode] == :w

          field_type = field[:type_fn].call
          result = Converter.convert(field_type, value)
          # TODO: error handling: if conversion throws, just put back whatever we got from the raw json?
          @data[field_name.to_sym] = result
        else
          @data[field_name.to_sym] = value
        end
      end
    end

    # Returns a Hash of the data underlying this object.
    # Keys are Symbols and values are the parsed / typed domain objects.
    # The return value indicates which values were ever set on the object -
    # i.e. there will be a key in this hash if they ever were, even if the
    # set value was nil.
    # This method is not recursive.
    # The returned value is shared by the object, so it should not be mutated.
    #
    # @return [Hash{Symbol => Object}] Data for this object.
    def to_h
      @data
    end

    alias_method :to_hash, :to_h

    # Lookup attribute value by key in the object.
    # If this key was not provided when the object was formed (e.g. because the API response
    # did not include that key), returns nil.
    # It is valid to lookup keys that are not in the API spec, for example to access
    # undocumented features.
    # Lookup by anything other than a Symbol is an ArgumentError.
    #
    # @param key [Symbol] Key to look up by.
    #
    # @return [Object] Parsed / typed value at the given key, or nil if no data is available.
    def [](key)
      if !key.instance_of?(Symbol)
        raise ArgumentError, "Expected symbol key for lookup, got #{key.inspect}"
      end
      @data[key]
    end

    # @return [String]
    def inspect
      "#<#{self.class.name}:0x#{object_id.to_s(16)} #{@data.inspect}>"
    end

    # @return [String]
    def to_s
      @data.to_s
    end
  end
end
