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

  describe 'instance methods' do
    describe "#monster_count" do
      before :each do
        @dungeon_1 = Dungeon.create!(
          name: "Blackreach", 
          kind: "Dwemer Ruins", 
          hold: "Winterhold", 
          cleared: false, 
          visit_count: 29
        )
        @mon_1 = @dungeon_1.monsters.create!(
          name: "Falmer",
          dead: false,
          health: 180,
          level: 9,
          soul_size: "Common",
          loot: "Falmer War Axe"
        )
        @mon_2 = @dungeon_1.monsters.create!(
          name: "Chaurus",
          dead: false,
          health: 253,
          level: 12,
          soul_size: "Lesser",
          loot: "Chaurus Chitin"
        )
        @mon_3 = @dungeon_1.monsters.create!(
          name: "Dwarven Centurion",
          dead: true,
          health: 653,
          level: 24,
          soul_size: "Grand",
          loot: "Centurion Dynamo Core"
        )
        @mon_4 = @dungeon_1.monsters.create!(
          name: "Frostbite Spider",
          dead: true,
          health: 220,
          level: 8,
          soul_size: "Petty",
          loot: "Frostbite Venom"
        )
        @dungeon_2 = Dungeon.create!(
          name: "Forsaken Cave",
          kind: "Cave",
          hold: "The Pale",
          cleared: true,
          visit_count: 30
        )
        @dun_2_mon_1 = @dungeon_2.monsters.create!(
          name: "Ice Wraith",
          dead: true,
          health: 193,
          level: 9,
          soul_size: "Lesser",
          loot: "Ice Wraith Teeth"
        )
        @dun_2_mon_2 = @dungeon_2.monsters.create!(
          name: "Draugr",
          dead: true,
          health: 50,
          level: 1,
          soul_size: "Petty",
          loot: "Ancient Nord Bow"
        )
        @dun_2_mon_3 = @dungeon_2.monsters.create!(
          name: "Curalmil",
          dead: true,
          health: 404,
          level: 15,
          soul_size: "Greater",
          loot: "Elven Shield of Greater Blocking"
        )
      end

      it 'returns the number of Monsters associated with a Dungeon' do
        expect(@dungeon_1.monster_count).to eq(4)
        expect(@dungeon_2.monster_count).to eq(3)
      end
    end
    
  end
end