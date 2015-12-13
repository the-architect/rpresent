require 'simplecov'

SimpleCov.start do
  add_group 'Lib', 'lib'
  add_group 'CoreExt', 'core_ext'
  add_filter 'spec'
end

require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rpresent'

require_relative 'support/test_classes'
