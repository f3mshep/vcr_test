require "pry"
require 'vcr'
require 'httparty'
require 'rspec'
require 'webmock'
require "magic_card"

RSpec.configure do |config|
  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html,
                                    # :json, CustomFormatterClass

  VCR.configure do |config|
    config.cassette_library_dir = "vcr_cassettes"
    config.hook_into :webmock
    config.configure_rspec_metadata!
  end


end