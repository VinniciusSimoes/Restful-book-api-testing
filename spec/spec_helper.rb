require 'httparty'
require 'dotenv'
require 'factory_bot'
require 'faker'

include FactoryBot::Syntax::Methods
FactoryBot.definition_file_paths = %w(./spec/supports/factories)
FactoryBot.find_definitions

Dotenv.load
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
