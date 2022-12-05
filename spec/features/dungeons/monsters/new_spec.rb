require 'rails_helper'

RSpec.describe "Dungeon's Monsters Create New Monster Page" do
  describe 'As a user' do
    describe "When I visit '/dungeons/:dungeon_id/monsters/new'" do
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
      end
      describe "When I fill in the form with the monster's attributes" do
        describe "And I click the button 'Create Monster'" do
          it "Then a 'POST' request is sent to '/dungeons/:dungeon_id/monsters',
          a new monster object/row is created for that dungeon,
          and I am redirected to the Dungeon's Monsters Index Page where I can
          see the new child listed" do
            visit "/dungeons/#{@dungeon_1.id}/monsters/new"

            fill_in('Name', with: 'Falmer Shaman')
            fill_in('Health', with: 460)
            fill_in('Level', with: 22)
            select('Greater', from: 'Soul Size')
            select(false, from: 'Dead?')
            fill_in('Loot', with: "Shaman's Key")
            click_button('Create Monster')

            expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/monsters")

            expect(page).to have_content('Falmer Shaman')
            expect(page).to have_content("Health: #{460}")
            expect(page).to have_content("Level: #{22}")
            expect(page).to have_content("Soul Size: Greater")
            expect(page).to have_content("Dead?: #{false}")
            expect(page).to have_content("Loot: Shaman's Key")
          end
        end
      end
    end
  end
end