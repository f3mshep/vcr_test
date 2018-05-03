require "httparty"

class MagicCard

  MULTIVERSE_RULING_URL = "https://api.scryfall.com/cards/multiverse/"
  PRETEND_HEADER = {test_api_key: "abc123"}

  attr_accessor :name, :card_id, :cmc

  def initialize(attributes = nil)
    attributes.each {|attribute, value| self.send("#{attribute}=", value)}
  end

  def get_card_info
    resp = HTTParty.get("#{MULTIVERSE_RULING_URL}/#{card_id}")
    self.name = resp["name"]
    self.cmc = resp["cmc"]
  end

  def get_card_info_with_header
    resp = HTTParty.get("#{MULTIVERSE_RULING_URL}/#{card_id}", headers: PRETEND_HEADER)
    self.name = resp["name"]
  end

end