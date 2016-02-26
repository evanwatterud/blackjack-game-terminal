require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new([Card.new(10, "♦"), Card.new(10, "♥")]) }
  let(:hand2) { Hand.new([Card.new(10, "♦"), Card.new("J", "♥"), Card.new("A", "♥")]) }
  let(:hand3) { Hand.new([Card.new("J", "♥"), Card.new("A", "♥")]) }
  let(:hand4) { Hand.new([Card.new(4, "♦"), Card.new(3, "♥"), Card.new(7, "♥")]) }
  let(:hand5) { Hand.new([Card.new("A", "♦"), Card.new("A", "♥")]) }
  let(:hand6) { Hand.new([Card.new(3, "♥"), Card.new("A", "♦"), Card.new("A", "♥"), Card.new(7, "♥")]) }
  let(:deck) { Deck.new }

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

  describe "#recieve_cards" do
    it "adds dealt cards to the hand" do
      hand.recieve_cards(deck.deal(2))
      expect(hand.cards.length).to eq 4
    end
  end
end
