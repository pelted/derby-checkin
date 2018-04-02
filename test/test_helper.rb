ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/ci'

class ActiveSupport::TestCase
  fixtures :all
end