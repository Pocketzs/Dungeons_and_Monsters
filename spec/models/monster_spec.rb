require 'rails_helper'

RSpec.describe Monster, type: :model do
  it {should belong_to :dungeon}

  describe 'class methods' do
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
    end
    describe '#all_dead' do
      it 'returns all dead monsters' do
        expected = [@mon_3, @mon_4]

        expect(Monster.all_dead).to eq(expected)
      end
    end

    describe '#alpha_sort_by_name' do
      it 'returns all monsters sorted alphabetically by name' do
        expected = [@mon_2, @mon_3, @mon_1, @mon_4]

        expect(Monster.alpha_sort_by_name).to eq(expected)
      end
    end

    describe '#attribute_threshold_select' do
      it 'returns all monsters that meet a given threshold for a given attribute' do
        params = {threshold: 300, attribute: 'health'}

        expect(Monster.attribute_threshold_select(params[:threshold], params[:attribute])).to eq([@mon_3])
      end
    end
  end
end