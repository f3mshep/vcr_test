require "httparty"

class MagicCard

  MULTIVERSE_URL = "https://api.scryfall.com/cards/multiverse/"

  attr_accessor :name, :card_id, :cmc

  def initialize(attributes = nil)
    attributes.each {|attribute, value| self.send("#{attribute}=", value)}
  end

  def get_card_info
    resp = HTTParty.get("#{MULTIVERSE_URL}/#{card_id}")
    self.name = resp["name"]
    self.cmc = resp["cmc"]
  end

end