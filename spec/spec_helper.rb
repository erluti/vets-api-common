require "bundler/setup"
require "vets_api_common"

require 'active_support'
require 'support/uploader_helpers'
require 'support/default_configuration_helper'

require 'fakeredis/rspec'
require 'timecop'
require 'factory_bot'
require 'faker'
require 'vcr'
require 'webmock'
require 'byebug' # REVIEW leave this in?

# REVIEW breaker setup needs to be handled somehow
Breakers.disabled = true

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.expose_dsl_globally = true

  config.include(UploaderHelpers, uploader_helpers: true)

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

VCR::MATCH_EVERYTHING = { match_requests_on: %i[method uri headers body] }.freeze

module VCR
  def self.all_matches
    %i[method uri body]
  end
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  # c.filter_sensitive_data('<PENSIONS_TOKEN>') { Settings.central_mail.upload.token }
  # c.filter_sensitive_data('<APP_TOKEN>') { Settings.mhv.rx.app_token }
  # c.filter_sensitive_data('<EVSS_BASE_URL>') { Settings.evss.url }
  # c.filter_sensitive_data('<EVSS_AWS_BASE_URL>') { Settings.evss.aws.url }
  # c.filter_sensitive_data('<GIDS_URL>') { Settings.gids.url }
  # c.filter_sensitive_data('<MHV_HOST>') { Settings.mhv.rx.host }
  # c.filter_sensitive_data('<MHV_SM_APP_TOKEN>') { Settings.mhv.sm.app_token }
  # c.filter_sensitive_data('<MHV_SM_HOST>') { Settings.mhv.sm.host }
  # c.filter_sensitive_data('<MVI_URL>') { Settings.mvi.url }
  # c.filter_sensitive_data('<PRENEEDS_HOST>') { Settings.preneeds.host }
  # c.filter_sensitive_data('<PD_TOKEN>') { Settings.maintenance.pagerduty_api_token }
  # c.filter_sensitive_data('<OKTA_TOKEN>') { Settings.oidc.base_api_token }
  # c.filter_sensitive_data('<EE_PASS>') { Settings.hca.ee.pass }
  # c.filter_sensitive_data('<AV_KEY>') { Settings.vet360.address_validation.api_key }
  c.before_record do |i|
    %i[response request].each do |env|
      next unless i.send(env).headers.keys.include?('Token')

      i.send(env).headers.update('Token' => '<SESSION_TOKEN>')
    end
  end
end

