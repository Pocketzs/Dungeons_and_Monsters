require 'rails_helper'

RSpec.describe Dungeon, type: :model do
  it {should have_many :monsters}
  describe 'class methods' do
    describe '#sort_by_most_recently_created' do
      before :each do
        @dungeon_1 = Dungeon.create!(
          name: "Blackreach", 
          kind: "Dwemer Ruins", 
          hold: "Winterhold", 
          cleared: false, 
          visit_count: 29
        )
        @dungeon_2 = Dungeon.create!(
          name: "Forsaken Cave",
          kind: "Cave",
          hold: "The Pale",
          cleared: true,
          visit_count: 30
        )
        @dungeon_3 = Dungeon.create!(
          name: "Bleak Falls Barrow",
          kind: "Nordic Tomb",
          hold: "Falkreath Hold",
          cleared: false,
          visit_count: 3
        )
        @dungeon_4 = Dungeon.create!(
          name: "Mistwatch",
          kind: "Fort Ruin",
          hold: "Eastmarch",
          cleared: true,
          visit_count: 17
        )
      end

      it 'returns an array sorted by most recently created at' do
        expected = [
          @dungeon_4,
          @dungeon_3,
          @dungeon_2,
          @dungeon_1
        ]
        expect(Dungeon.sort_by_most_recently_created).to eq(expected)
      end
    end
  end
end