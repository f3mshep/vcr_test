require "spec_helper"

describe "#get_card_info" do
  let(:black_lotus ) {MagicCard.new({card_id: 382866})}
  it "sends a GET request to correct endpoint" do
    VCR.use_cassette("black lotus") do
      HTTParty.get( 'https://api.scryfall.com/cards/multiverse/382866')
      black_lotus.get_card_info
    end
    expect(black_lotus.name).to eq("Black Lotus")
  end
end

