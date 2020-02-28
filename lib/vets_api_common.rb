require "vets_api_common/version"

require 'redis'
require 'redis-namespace'
require 'ostruct'
require 'mini_magick'
require 'carrierwave'
require 'active_support/all' # do we want all?
require 'active_model'
require 'action_dispatch'
require 'oj'
require 'faraday'
require 'breakers'
require 'yaml'
require 'statsd-instrument'
require 'sentry-raven'
require 'webrick'
require 'ox'

require 'common/convert_to_pdf'
require 'common/virus_scan'
require 'common/file_helpers'
require 'common/event_rate_limiter'
require 'common/hash_helpers'
require 'common/exceptions'
require 'common/client/base'
require 'common/client/concerns/monitoring'
require 'common/client/concerns/log_as_warning_helpers'
require 'common/client/middleware/logging'
require 'common/client/middleware/response/soap_parser'
require 'common/client/middleware/request/remove_cookies'
require 'common/client/middleware/request/immutable_headers'
require 'common/models/message'

# TODO review specs to not require files under test
# TODO review requires so they are called logically

byebug # TODO remove this, just trying to see when this is loaded by vets-api

#set up translation files for exceptions
I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]

# REVIEW does this config need to be set externally
REDIS_CONFIG = YAML.load(File.read('config/redis.yml'))['test'] # REVIEW use environment here
# set the current global instance of Redis based on environment specific config
Redis.current = Redis.new(REDIS_CONFIG['redis'])

require 'stats_d_metric'
# REVIEW this isn't gem-ready, but some stuff in here needs it
require 'sentry_logging'

# REVIEW should these be here or in rails?  Add "initializer" class to be called from Rails?
Faraday::Middleware.register_middleware remove_cookies: Common::Client::Middleware::Request::RemoveCookies
Faraday::Middleware.register_middleware immutable_headers: Common::Client::Middleware::Request::ImmutableHeaders

# Faraday::Response.register_middleware hca_soap_parser: HCA::SOAPParser
