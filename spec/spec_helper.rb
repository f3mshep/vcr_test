require 'vcr'
require 'httparty'
require 'rspec'
require "magic_card"
require "webmock/rspec"
require "record_vcr"

DAY_IN_SECONDS = 86400

RSpec.configure do |config|

  # Use color in STDOUT
  config.color = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html,
                                    # :json, CustomFormatterClass

  # VCR config
  VCR.configure do |config|
    config.default_cassette_options = { :re_record_interval => 7 * DAY_IN_SECONDS }
    config.cassette_library_dir = "spec/vcr_cassettes"
    config.hook_into :webmock
    config.configure_rspec_metadata!
  end


end