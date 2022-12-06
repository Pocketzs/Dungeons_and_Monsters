require 'rails_helper'

RSpec.describe "Monsters Index", type: :feature do
  describe "As a user" do
    describe "When I visit '/monsters/:id" do
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

      it "Then I see the monster with that id including the monster's attributes" do

        visit "/monsters/#{@mon_1.id}"
        # save_and_open_page
        expect(page).to have_content(@mon_1.name)
        expect(page).to have_content("Dead?: #{@mon_1.dead}")
        expect(page).to have_content("Health: #{@mon_1.health}")
        expect(page).to have_content("Level: #{@mon_1.level}")
        expect(page).to have_content("Soul Size: #{@mon_1.soul_size}")
        expect(page).to have_content("Loot: #{@mon_1.loot}")
        expect(page).to_not have_content(@mon_2.name)
        expect(page).to_not have_content("Dead?: #{@mon_2.dead}")
        expect(page).to_not have_content("Health: #{@mon_2.health}")
        expect(page).to_not have_content("Level: #{@mon_2.level}")
        expect(page).to_not have_content("Soul Size: #{@mon_2.soul_size}")
        expect(page).to_not have_content("Loot: #{@mon_2.loot}")
      end

      it 'Then I see a link to update that Monster "Update Monster"' do
        visit "/monsters/#{@mon_1.id}"

        expect(page).to have_link("Update Monster", href: "/monsters/#{@mon_1.id}/edit")
      end

      describe "When I click the link" do
        it "I am taken to '/monsters/:id/edit' where I see a form to edit the child's attributes" do
          visit "/monsters/#{@mon_1.id}"

          click_link("Update Monster")

          expect(current_path).to eq("/monsters/#{@mon_1.id}/edit")
        end
      end
    end
  end
end