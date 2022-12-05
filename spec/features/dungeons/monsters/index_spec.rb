require 'rails_helper'

RSpec.describe "Dungeon's Monsters Index" do
  describe "As a user" do
    describe "When I visit '/dungeons/:dungeon_id/monsters" do
      before :each do
        @dungeon_1 = Dungeon.create!(
          name: "Blackreach", 
          kind: "Dwemer Ruins", 
          hold: "Winterhold", 
          cleared: false, 
          visit_count: 29
        )
        @dun_1_mon_1 = @dungeon_1.monsters.create!(
          name: "Falmer",
          dead: false,
          health: 180,
          level: 9,
          soul_size: "Common",
          loot: "Falmer War Axe"
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
          level: 10,
          soul_size: "Lesser",
          loot: "Ice Wraith Teeth"
        )
      end

      it "Then I see each Monster that is associated with that Dungeon with each monster's attributes" do
        visit "/dungeons/#{@dungeon_1.id}/monsters"

        expect(page).to have_content(@dun_1_mon_1.name)
        expect(page).to have_content("Dead?: #{@dun_1_mon_1.dead}")
        expect(page).to have_content("Health: #{@dun_1_mon_1.health}")
        expect(page).to have_content("Level: #{@dun_1_mon_1.level}")
        expect(page).to have_content("Soul Size: #{@dun_1_mon_1.soul_size}")
        expect(page).to have_content("Loot: #{@dun_1_mon_1.loot}")
        expect(page).to_not have_content(@dun_2_mon_1.name)
        expect(page).to_not have_content("Dead?: #{@dun_2_mon_1.dead}")
        expect(page).to_not have_content("Health: #{@dun_2_mon_1.health}")
        expect(page).to_not have_content("Level: #{@dun_2_mon_1.level}")
        expect(page).to_not have_content("Soul Size: #{@dun_2_mon_1.soul_size}")
        expect(page).to_not have_content("Loot: #{@dun_2_mon_1.loot}")
      end

      it 'Then I see a link to add a new adoptable monster for the dungeon "Create Monster"' do
        visit "/dungeons/#{@dungeon_1.id}/monsters"

        expect(page).to have_link("Create Monster", href: "/dungeons/#{@dungeon_1.id}/monsters/new")
      end

      describe "When I click the link" do
        it "I am taken to '/dungeons/:dungeon_id/monsters/new' where I see a form to add a new adoptable
        monster" do
          visit "/dungeons/#{@dungeon_1.id}/monsters"
          click_link("Create Monster")
          
          save_and_open_page
          expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/monsters/new")
          expect(page).to have_field("Name")
          expect(page).to have_field("Health")
          expect(page).to have_field("Level")
          expect(page).to have_field("Soul Size")
          expect(page).to have_field("Dead?")
          expect(page).to have_field("Loot")
        end
      end
    end
  end
end