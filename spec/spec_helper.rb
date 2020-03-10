$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'xlsx_writer_wrapper'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.color = true
  config.profile_examples = 10
  config.order = :random

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
