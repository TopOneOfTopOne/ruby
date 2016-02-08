require_relative 'spec_helper'

describe Player do
  before :each do
    @player = Player.new
  end

  describe "#new" do
    context 'freshly created Player object' do
      subject {@player}
      it {is_expected.to be_an_instance_of(Player)}
      it "has empty array for positions" do
        expect(@player.pos).to eq([])
      end
    end
  end

  describe 'adding new position' do
    context "fresh Player object" do
      it 'contains newly added position' do
        to_add_pos = [1,3]
        @player.pos << to_add_pos
        expect(@player.pos).to include(to_add_pos)
      end
    end
    context 'old Player object' do
      @player = Player.new
      @player.pos = ([[1,2],[3,5],[6,6]])
      it 'contains newly added position' do
        to_add_pos = [3,4]
        @player.pos << to_add_pos
        expect(@player.pos).to include(to_add_pos)
      end
    end
  end
end

