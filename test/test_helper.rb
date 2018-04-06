# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'

SimpleCov.start 'rails' do
  add_filter do |source_file|
    source_file.lines.count < 5
  end
end

require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/ci'

Minitest::Ci.report_dir = File.join('tmp', 'reports')

class ActiveSupport::TestCase # rubocop:disable Style/ClassAndModuleChildren
  fixtures :all
end
