require 'rails_helper'

RSpec.describe "Monster edit form" do
  describe "As a user" do
    describe "When I visit '/monsters/:id/edit" do
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
          dead: true,
          health: 253,
          level: 12,
          soul_size: "Lesser",
          loot: "Chaurus Chitin"
        )
      end
      it 'Then I see a pre filled in form to edit the monster' do
        visit "/monsters/#{@mon_1.id}/edit"

        expect(page).to have_field('Name', with: 'Falmer')
        expect(page).to have_field('Dead?', with: false)
        expect(page).to have_field('Health', with: 180)
        expect(page).to have_field('Level', with: 9)
        expect(page).to have_field('Soul Size', with: 'Common')
        expect(page).to have_field('Loot', with: 'Falmer War Axe')

        visit "/monsters/#{@mon_2.id}/edit"
        
        expect(page).to have_field('Name', with: 'Chaurus')
        expect(page).to have_field('Dead?', with: true)
        expect(page).to have_field('Health', with: 253)
        expect(page).to have_field('Level', with: 12)
        expect(page).to have_field('Soul Size', with: 'Lesser')
        expect(page).to have_field('Loot', with: 'Chaurus Chitin')
      end
      describe "When I click the button to submit the form 'Update Monster'" do
        it "Then a 'PATCH' request is sent to '/monsters/:id', the monster's data is updated
        and I am redirected to the Monster Show page where I see the Monster's updated information" do
        visit "/monsters/#{@mon_1.id}/edit"

        fill_in('Name', with: 'Falmer Shaman')
        fill_in('Health', with: 460)
        fill_in('Level', with: 22)
        select('Greater', from: 'Soul Size')
        select(false, from: 'Dead?')
        fill_in('Loot', with: "Shaman's Key")
        click_button('Update Monster')

        expect(current_path).to eq("/monsters/#{@mon_1.id}")

        expect(page).to have_content('Falmer Shaman')
        expect(page).to have_content("Health: #{460}")
        expect(page).to have_content("Level: #{22}")
        expect(page).to have_content("Soul Size: Greater")
        expect(page).to have_content("Dead?: #{false}")
        expect(page).to have_content("Loot: Shaman's Key")

        expect(page).to_not have_content('Health: 180')
        end
      end
    end
  end
end