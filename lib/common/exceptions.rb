# frozen_string_literal: true

require 'common/exceptions/base_error'
require 'common/exceptions/serializable_error'
require 'common/exceptions/internal/invalid_resource'
require 'common/exceptions/internal/unknown_format'
require 'common/exceptions/internal/validation_errors'
require 'common/exceptions/internal/service_outage'
require 'common/exceptions/internal/not_a_safe_host_error'
require 'common/exceptions/internal/record_not_found'
require 'common/exceptions/internal/invalid_pagination_params'
require 'common/exceptions/internal/parameter_missing'
require 'common/exceptions/internal/schema_validation_errors'
require 'common/exceptions/internal/invalid_field_value'
require 'common/exceptions/internal/invalid_field'
require 'common/exceptions/internal/message_authenticity_error'
require 'common/exceptions/internal/routing_error'
require 'common/exceptions/internal/invalid_sort_criteria'
require 'common/exceptions/internal/invalid_filters_syntax'
require 'common/exceptions/internal/filter_not_allowed'
require 'common/exceptions/internal/unauthorized'
require 'common/exceptions/internal/forbidden'
require 'common/exceptions/internal/unexpected_forbidden'
require 'common/exceptions/internal/internal_server_error'
require 'common/exceptions/internal/too_many_requests'
require 'common/exceptions/external/backend_service_exception'
require 'common/exceptions/external/service_error'
require 'common/exceptions/external/resource_not_found'
require 'common/exceptions/external/gateway_timeout'
require 'common/exceptions/external/unprocessable_entity'
require 'common/exceptions/external/bad_gateway'
require 'common/exceptions/external/bing_service_error'
require 'common/exceptions/internal/ambiguous_request'
require 'common/exceptions/internal/token_validation_error'
require 'common/exceptions/internal/no_query_params_allowed'
