# frozen_string_literal: true

require 'bundler/setup'
require 'service_actor/rails'

require 'pry'
require 'aruba/api'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Aruba
  config.include(Aruba::Api)

  config.before do
    setup_aruba
  end

  Aruba.configure do |config|
    config.exit_timeout = 60
  end
end
