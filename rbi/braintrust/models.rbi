# typed: strong

module Braintrust
  ACL = Braintrust::Models::ACL

  ACLBatchUpdateParams = Braintrust::Models::ACLBatchUpdateParams

  ACLBatchUpdateResponse = Braintrust::Models::ACLBatchUpdateResponse

  ACLCreateParams = Braintrust::Models::ACLCreateParams

  ACLDeleteParams = Braintrust::Models::ACLDeleteParams

  ACLFindAndDeleteParams = Braintrust::Models::ACLFindAndDeleteParams

  ACLListParams = Braintrust::Models::ACLListParams

  ACLObjectType = Braintrust::Models::ACLObjectType

  ACLRetrieveParams = Braintrust::Models::ACLRetrieveParams

  AISecret = Braintrust::Models::AISecret

  AISecretCreateParams = Braintrust::Models::AISecretCreateParams

  AISecretDeleteParams = Braintrust::Models::AISecretDeleteParams

  AISecretFindAndDeleteParams = Braintrust::Models::AISecretFindAndDeleteParams

  AISecretListParams = Braintrust::Models::AISecretListParams

  AISecretReplaceParams = Braintrust::Models::AISecretReplaceParams

  AISecretRetrieveParams = Braintrust::Models::AISecretRetrieveParams

  AISecretUpdateParams = Braintrust::Models::AISecretUpdateParams

  APIKey = Braintrust::Models::APIKey

  APIKeyCreateParams = Braintrust::Models::APIKeyCreateParams

  APIKeyDeleteParams = Braintrust::Models::APIKeyDeleteParams

  APIKeyListParams = Braintrust::Models::APIKeyListParams

  APIKeyRetrieveParams = Braintrust::Models::APIKeyRetrieveParams

  ChatCompletionContentPartImage = Braintrust::Models::ChatCompletionContentPartImage

  ChatCompletionContentPartText = Braintrust::Models::ChatCompletionContentPartText

  ChatCompletionMessageToolCall = Braintrust::Models::ChatCompletionMessageToolCall

  CodeBundle = Braintrust::Models::CodeBundle

  CreateAPIKeyOutput = Braintrust::Models::CreateAPIKeyOutput

  CrossObjectInsertResponse = Braintrust::Models::CrossObjectInsertResponse

  Dataset = Braintrust::Models::Dataset

  DatasetCreateParams = Braintrust::Models::DatasetCreateParams

  DatasetDeleteParams = Braintrust::Models::DatasetDeleteParams

  DatasetEvent = Braintrust::Models::DatasetEvent

  DatasetFeedbackParams = Braintrust::Models::DatasetFeedbackParams

  DatasetFetchParams = Braintrust::Models::DatasetFetchParams

  DatasetFetchPostParams = Braintrust::Models::DatasetFetchPostParams

  DatasetInsertParams = Braintrust::Models::DatasetInsertParams

  DatasetListParams = Braintrust::Models::DatasetListParams

  DatasetRetrieveParams = Braintrust::Models::DatasetRetrieveParams

  DatasetSummarizeParams = Braintrust::Models::DatasetSummarizeParams

  DatasetUpdateParams = Braintrust::Models::DatasetUpdateParams

  DataSummary = Braintrust::Models::DataSummary

  EnvVar = Braintrust::Models::EnvVar

  EnvVarCreateParams = Braintrust::Models::EnvVarCreateParams

  EnvVarDeleteParams = Braintrust::Models::EnvVarDeleteParams

  EnvVarListParams = Braintrust::Models::EnvVarListParams

  EnvVarObjectType = Braintrust::Models::EnvVarObjectType

  EnvVarReplaceParams = Braintrust::Models::EnvVarReplaceParams

  EnvVarRetrieveParams = Braintrust::Models::EnvVarRetrieveParams

  EnvVarUpdateParams = Braintrust::Models::EnvVarUpdateParams

  EvalCreateParams = Braintrust::Models::EvalCreateParams

  Experiment = Braintrust::Models::Experiment

  ExperimentCreateParams = Braintrust::Models::ExperimentCreateParams

  ExperimentDeleteParams = Braintrust::Models::ExperimentDeleteParams

  ExperimentEvent = Braintrust::Models::ExperimentEvent

  ExperimentFeedbackParams = Braintrust::Models::ExperimentFeedbackParams

  ExperimentFetchParams = Braintrust::Models::ExperimentFetchParams

  ExperimentFetchPostParams = Braintrust::Models::ExperimentFetchPostParams

  ExperimentInsertParams = Braintrust::Models::ExperimentInsertParams

  ExperimentListParams = Braintrust::Models::ExperimentListParams

  ExperimentRetrieveParams = Braintrust::Models::ExperimentRetrieveParams

  ExperimentSummarizeParams = Braintrust::Models::ExperimentSummarizeParams

  ExperimentUpdateParams = Braintrust::Models::ExperimentUpdateParams

  FeedbackDatasetItem = Braintrust::Models::FeedbackDatasetItem

  FeedbackExperimentItem = Braintrust::Models::FeedbackExperimentItem

  FeedbackProjectLogsItem = Braintrust::Models::FeedbackProjectLogsItem

  FeedbackResponseSchema = Braintrust::Models::FeedbackResponseSchema

  FetchDatasetEventsResponse = Braintrust::Models::FetchDatasetEventsResponse

  FetchExperimentEventsResponse = Braintrust::Models::FetchExperimentEventsResponse

  FetchProjectLogsEventsResponse = Braintrust::Models::FetchProjectLogsEventsResponse

  Function = Braintrust::Models::Function

  FunctionCreateParams = Braintrust::Models::FunctionCreateParams

  FunctionDeleteParams = Braintrust::Models::FunctionDeleteParams

  FunctionInvokeParams = Braintrust::Models::FunctionInvokeParams

  FunctionListParams = Braintrust::Models::FunctionListParams

  FunctionReplaceParams = Braintrust::Models::FunctionReplaceParams

  FunctionRetrieveParams = Braintrust::Models::FunctionRetrieveParams

  FunctionUpdateParams = Braintrust::Models::FunctionUpdateParams

  Group = Braintrust::Models::Group

  GroupCreateParams = Braintrust::Models::GroupCreateParams

  GroupDeleteParams = Braintrust::Models::GroupDeleteParams

  GroupListParams = Braintrust::Models::GroupListParams

  GroupReplaceParams = Braintrust::Models::GroupReplaceParams

  GroupRetrieveParams = Braintrust::Models::GroupRetrieveParams

  GroupUpdateParams = Braintrust::Models::GroupUpdateParams

  InsertDatasetEvent = Braintrust::Models::InsertDatasetEvent

  InsertEventsResponse = Braintrust::Models::InsertEventsResponse

  InsertExperimentEvent = Braintrust::Models::InsertExperimentEvent

  InsertProjectLogsEvent = Braintrust::Models::InsertProjectLogsEvent

  MetricSummary = Braintrust::Models::MetricSummary

  ObjectReference = Braintrust::Models::ObjectReference

  OnlineScoreConfig = Braintrust::Models::OnlineScoreConfig

  Organization = Braintrust::Models::Organization

  OrganizationDeleteParams = Braintrust::Models::OrganizationDeleteParams

  OrganizationListParams = Braintrust::Models::OrganizationListParams

  OrganizationRetrieveParams = Braintrust::Models::OrganizationRetrieveParams

  Organizations = Braintrust::Models::Organizations

  OrganizationUpdateParams = Braintrust::Models::OrganizationUpdateParams

  PatchOrganizationMembersOutput = Braintrust::Models::PatchOrganizationMembersOutput

  Permission = Braintrust::Models::Permission

  Project = Braintrust::Models::Project

  ProjectCreateParams = Braintrust::Models::ProjectCreateParams

  ProjectDeleteParams = Braintrust::Models::ProjectDeleteParams

  ProjectListParams = Braintrust::Models::ProjectListParams

  ProjectLogsEvent = Braintrust::Models::ProjectLogsEvent

  ProjectRetrieveParams = Braintrust::Models::ProjectRetrieveParams

  Projects = Braintrust::Models::Projects

  ProjectScore = Braintrust::Models::ProjectScore

  ProjectScoreCategory = Braintrust::Models::ProjectScoreCategory

  ProjectScoreConfig = Braintrust::Models::ProjectScoreConfig

  ProjectScoreCreateParams = Braintrust::Models::ProjectScoreCreateParams

  ProjectScoreDeleteParams = Braintrust::Models::ProjectScoreDeleteParams

  ProjectScoreListParams = Braintrust::Models::ProjectScoreListParams

  ProjectScoreReplaceParams = Braintrust::Models::ProjectScoreReplaceParams

  ProjectScoreRetrieveParams = Braintrust::Models::ProjectScoreRetrieveParams

  ProjectScoreType = Braintrust::Models::ProjectScoreType

  ProjectScoreUpdateParams = Braintrust::Models::ProjectScoreUpdateParams

  ProjectSettings = Braintrust::Models::ProjectSettings

  ProjectTag = Braintrust::Models::ProjectTag

  ProjectTagCreateParams = Braintrust::Models::ProjectTagCreateParams

  ProjectTagDeleteParams = Braintrust::Models::ProjectTagDeleteParams

  ProjectTagListParams = Braintrust::Models::ProjectTagListParams

  ProjectTagReplaceParams = Braintrust::Models::ProjectTagReplaceParams

  ProjectTagRetrieveParams = Braintrust::Models::ProjectTagRetrieveParams

  ProjectTagUpdateParams = Braintrust::Models::ProjectTagUpdateParams

  ProjectUpdateParams = Braintrust::Models::ProjectUpdateParams

  Prompt = Braintrust::Models::Prompt

  PromptCreateParams = Braintrust::Models::PromptCreateParams

  PromptData = Braintrust::Models::PromptData

  PromptDeleteParams = Braintrust::Models::PromptDeleteParams

  PromptListParams = Braintrust::Models::PromptListParams

  PromptOptions = Braintrust::Models::PromptOptions

  PromptReplaceParams = Braintrust::Models::PromptReplaceParams

  PromptRetrieveParams = Braintrust::Models::PromptRetrieveParams

  PromptUpdateParams = Braintrust::Models::PromptUpdateParams

  RepoInfo = Braintrust::Models::RepoInfo

  Role = Braintrust::Models::Role

  RoleCreateParams = Braintrust::Models::RoleCreateParams

  RoleDeleteParams = Braintrust::Models::RoleDeleteParams

  RoleListParams = Braintrust::Models::RoleListParams

  RoleReplaceParams = Braintrust::Models::RoleReplaceParams

  RoleRetrieveParams = Braintrust::Models::RoleRetrieveParams

  RoleUpdateParams = Braintrust::Models::RoleUpdateParams

  ScoreSummary = Braintrust::Models::ScoreSummary

  SpanAttributes = Braintrust::Models::SpanAttributes

  SpanIFrame = Braintrust::Models::SpanIFrame

  SpanIframeCreateParams = Braintrust::Models::SpanIframeCreateParams

  SpanIframeDeleteParams = Braintrust::Models::SpanIframeDeleteParams

  SpanIframeListParams = Braintrust::Models::SpanIframeListParams

  SpanIframeReplaceParams = Braintrust::Models::SpanIframeReplaceParams

  SpanIframeRetrieveParams = Braintrust::Models::SpanIframeRetrieveParams

  SpanIframeUpdateParams = Braintrust::Models::SpanIframeUpdateParams

  SpanType = Braintrust::Models::SpanType

  SummarizeDatasetResponse = Braintrust::Models::SummarizeDatasetResponse

  SummarizeExperimentResponse = Braintrust::Models::SummarizeExperimentResponse

  TopLevelHelloWorldParams = Braintrust::Models::TopLevelHelloWorldParams

  User = Braintrust::Models::User

  UserListParams = Braintrust::Models::UserListParams

  UserRetrieveParams = Braintrust::Models::UserRetrieveParams

  View = Braintrust::Models::View

  ViewCreateParams = Braintrust::Models::ViewCreateParams

  ViewData = Braintrust::Models::ViewData

  ViewDataSearch = Braintrust::Models::ViewDataSearch

  ViewDeleteParams = Braintrust::Models::ViewDeleteParams

  ViewListParams = Braintrust::Models::ViewListParams

  ViewOptions = Braintrust::Models::ViewOptions

  ViewReplaceParams = Braintrust::Models::ViewReplaceParams

  ViewRetrieveParams = Braintrust::Models::ViewRetrieveParams

  ViewType = Braintrust::Models::ViewType

  ViewUpdateParams = Braintrust::Models::ViewUpdateParams
end
