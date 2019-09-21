# require "dji/version"
require 'nokogiri'
require 'pry'
require 'colorize'
require 'open-uri'
require 'irb'


require_relative '../lib/dji/version.rb'
require_relative '../lib/dji/scraper.rb'
require_relative '../lib/dji/devices.rb'
require_relative '../lib/dji/cli.rb'



module Dji
  class Error < StandardError; end
  # Your code goes here...
end
