ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'
require 'webmock/minitest'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # from test_helper.rb
  self.use_instantiated_fixtures = true


  # Add more helper methods to be used by all tests here...

  def read_file name
    filepath = "#{Rails.root}/test/fixtures/files/#{name}"
    return File.read(filepath)
  end
end
