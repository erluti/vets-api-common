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
require 'byebug' # REVIEW leave this in?

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
