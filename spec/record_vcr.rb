require 'vcr'

VCR.use_cassette("black lotus") do
  HTTParty.get( 'https://api.scryfall.com/cards/multiverse/382866')
end