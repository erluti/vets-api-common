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

require 'common/convert_to_pdf'
require 'common/virus_scan'
require 'common/file_helpers'
require 'common/event_rate_limiter'
require 'common/hash_helpers'
require 'common/exceptions/serializable_error'

# REVIEW this isn't gem-ready, but some stuff in here needs it
require 'sentry_logging'

# TODO review specs to not require files under test
