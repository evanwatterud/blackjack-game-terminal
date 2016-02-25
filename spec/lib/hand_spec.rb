require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new(["10♦", "J♥"]) }
  let(:hand2) { Hand.new(["10♦", "J♥", "A♥"]) }
  let(:hand3) { Hand.new(["J♥", "A♥"]) }
  let(:hand4) { Hand.new(["4♦", "3♥", "7♥"]) }
  let(:hand5) { Hand.new(["A♦", "A♥"]) }
  let(:hand6) { Hand.new(["3♥", "A♦", "A♥", "7♥"]) }

  describe "#calculate_hand" do
    # Sample tests (change these once you understand)
    it "returns a Fixnum" do
      # use `expect` to test assertions
      expect(hand.calculate_hand).to be_a Fixnum
    end

    it "returns correct point values" do
      expect(hand.calculate_hand).to eq 20
    end

    it "calulates blackjack with Ace" do
      expect(hand2.calculate_hand).to eq 21
    end

    it "uses Ace as 11 when appropriate" do
      expect(hand3.calculate_hand).to eq 21
    end

    it "calculates non-face cards properly" do
      expect(hand4.calculate_hand).to eq 14
    end

    it "calculates multiple aces properly" do
      expect(hand5.calculate_hand).to eq 12
    end

    it "handles ace points recalculation" do
      expect(hand6.calculate_hand).to eq 12
    end
  end
end
