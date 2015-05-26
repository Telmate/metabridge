$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'meta_bridge'

require 'minitest/autorun'
require 'minitest/pride'
