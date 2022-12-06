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
        @dun_1_mon_2 = @dungeon_1.monsters.create!(
          name: "Chaurus",
          dead: false,
          health: 253,
          level: 12,
          soul_size: "Lesser",
          loot: "Chaurus Chitin"
        )
        @dun_1_mon_3 = @dungeon_1.monsters.create!(
          name: "Dwarven Centurion",
          dead: true,
          health: 653,
          level: 24,
          soul_size: "Grand",
          loot: "Centurion Dynamo Core"
        )
        @dun_1_mon_4 = @dungeon_1.monsters.create!(
          name: "Frostbite Spider",
          dead: true,
          health: 220,
          level: 8,
          soul_size: "Petty",
          loot: "Frostbite Venom"
        )
      end

      it "Then I see each Monster that is associated with that Dungeon with each monster's attributes" do
        visit "/dungeons/#{@dungeon_1.id}/monsters"

        expect(page).to have_content(@dun_1_mon_1.name)
        expect(page).to have_content(@dun_1_mon_2.name)
        expect(page).to have_content(@dun_1_mon_3.name)
        expect(page).to have_content(@dun_1_mon_4.name)
        expect(page).to have_content("Dead?: #{@dun_1_mon_1.dead}")
        expect(page).to have_content("Health: #{@dun_1_mon_1.health}")
        expect(page).to have_content("Level: #{@dun_1_mon_1.level}")
        expect(page).to have_content("Soul Size: #{@dun_1_mon_1.soul_size}")
        expect(page).to have_content("Loot: #{@dun_1_mon_1.loot}")
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
          
          expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/monsters/new")
          expect(page).to have_field("Name")
          expect(page).to have_field("Health")
          expect(page).to have_field("Level")
          expect(page).to have_field("Soul Size")
          expect(page).to have_field("Dead?")
          expect(page).to have_field("Loot")
        end
      end

      it 'Then I see a link to sort monsters in alphabetical order' do
        visit "/dungeons/#{@dungeon_1.id}/monsters"

        expect(page).to have_link('Sort Monsters Alphabetically', href: "/dungeons/#{@dungeon_1.id}/monsters?sort=alpha")
      end

      describe "When I click on the link" do
        it "I'm taken back to the Dungeon's monsters Index page where I see all of the 
        dungeon's monsters in alphabetical order" do
          visit "/dungeons/#{@dungeon_1.id}/monsters"

          click_link('Sort Monsters Alphabetically')

          expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/monsters")

          expect(@dun_1_mon_2.name).to appear_before (@dun_1_mon_3.name)
          expect(@dun_1_mon_3.name).to appear_before (@dun_1_mon_1.name)
          expect(@dun_1_mon_1.name).to appear_before (@dun_1_mon_4.name)
        end
      end
    end
  end
end