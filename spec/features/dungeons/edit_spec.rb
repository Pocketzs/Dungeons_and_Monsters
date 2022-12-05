require 'rails_helper'

RSpec.describe 'Edit Dungeon Page' do
  describe 'As a user' do
    describe 'When I visit "/dungeons/:dungeon_id/edit"' do
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
      end

      it "Then I see the form prefilled with the original data" do
        visit "/dungeons/#{@dungeon_1.id}/edit"

        expect(page).to have_field('Name', with: 'Blackreach')
        expect(page).to have_field('Type', with: 'Dwemer Ruins')          
        expect(page).to have_field('Hold', with: 'Winterhold')          
        expect(page).to have_field('Cleared?', with: false)
        expect(page).to have_field('Visit Count', with: 29)

        visit "/dungeons/#{@dungeon_2.id}/edit"

        expect(page).to have_field('Name', with: 'Forsaken Cave')
        expect(page).to have_field('Type', with: 'Cave')          
        expect(page).to have_field('Hold', with: 'The Pale')          
        expect(page).to have_field('Cleared?', with: true)
        expect(page).to have_field('Visit Count', with: 30)
      end

      describe 'When I fill out the form with updated information and I click the button
      to submit the form' do
        it 'Then a "PATCH" request is sent to "/dungeons/:id", the dungeons info is updated,
        and I am redirected to the Dungeons Show page where I see the dungeons updated
        info' do
          visit "/dungeons/#{@dungeon_1.id}/edit"

          fill_in('Name', with: 'Greywater Grotto')
          select('Cave', from: 'Type')
          select('Falkreath Hold', from: 'Hold')
          select(false, from: 'Cleared?')
          fill_in('Visit Count', with: 0)
          click_button('Confirm')

          expect(current_path).to eq("/dungeons/#{@dungeon_1.id}")

          expect(page).to have_content('Greywater Grotto')
          expect(page).to have_content('Type: Cave')
          expect(page).to have_content('Hold: Falkreath Hold')
          expect(page).to have_content("Cleared?: #{false}")
          expect(page).to have_content("Visit Count: #{0}")
        end
      end
    end
  end
end