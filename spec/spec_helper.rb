require 'rubygems'
require 'rspec'
require File.dirname(__FILE__) + '/../lib/pseudo_date'
require 'byebug'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end