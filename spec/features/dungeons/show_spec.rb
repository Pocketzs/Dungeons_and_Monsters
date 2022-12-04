require 'rails_helper'

RSpec.describe "Dungeon Show", type: :feature do
  describe 'As a user' do
    describe 'When I visit /dungeons/:id' do
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

      it "Then I see the dungeon with corresponding id and its attributes" do
        visit "/dungeons/#{@dungeon_1.id}" 
        # save_and_open_page
        expect(page).to have_content(@dungeon_1.name)
        expect(page).to have_content("Type: #{@dungeon_1.kind}")
        expect(page).to have_content("Hold: #{@dungeon_1.hold}")
        expect(page).to have_content("Cleared?: #{@dungeon_1.cleared}")
        expect(page).to have_content("Visit Count: #{@dungeon_1.visit_count}")
        expect(page).to_not have_content(@dungeon_2.name)
        expect(page).to_not have_content("Type: #{@dungeon_2.kind}")
        expect(page).to_not have_content("Hold: #{@dungeon_2.hold}")
        expect(page).to_not have_content("Cleared?: #{@dungeon_2.cleared}")
        expect(page).to_not have_content("Visit Count: #{@dungeon_2.visit_count}")
      end

      it "Then I see a count of the number of monsters associated with this dungeon" do
        visit "/dungeons/#{@dungeon_1.id}"

        expect(page).to have_content("Number of Monsters: #{@dungeon_1.monster_count}")
      end

      it "Then I see a link to take me to that Dungeon's Monsters page '/dungeons/:dungeon_id/monsters'" do
        visit "/dungeons/#{@dungeon_1.id}"

        expect(page).to have_link("View Monsters", href: "/dungeons/#{@dungeon_1.id}/monsters")
      end
    end
  end
end