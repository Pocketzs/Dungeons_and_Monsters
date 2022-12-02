require 'rails_helper'

RSpec.describe "Monsters Index", type: :feature do
  describe "As a user" do
    describe "When I visit '/monsters/:id" do
      it "Then I see the monster with that id including the monster's attributes" do
        mon_1 = Monster.create!(
          name: "Falmer",
          dead: false,
          health: 180,
          level: 9,
          soul_size: "Common",
          loot: "Falmer War Axe"
        )
        mon_2 = Monster.create!(
          name: "Chaurus",
          dead: true,
          health: 253,
          level: 12,
          soul_size: "Lesser",
          loot: "Chaurus Chitin"
        )

        visit "/monsters/#{mon_1.id}"
        save_and_open_page
        expect(page).to have_content(mon_1.name)
        expect(page).to have_content("Dead?: #{mon_1.dead}")
        expect(page).to have_content("Health: #{mon_1.health}")
        expect(page).to have_content("Level: #{mon_1.level}")
        expect(page).to have_content("Soul Size: #{mon_1.soul_size}")
        expect(page).to have_content("Loot: #{mon_1.loot}")
        expect(page).to_not have_content(mon_2.name)
        expect(page).to_not have_content("Dead?: #{mon_2.dead}")
        expect(page).to_not have_content("Health: #{mon_2.health}")
        expect(page).to_not have_content("Level: #{mon_2.level}")
        expect(page).to_not have_content("Soul Size: #{mon_2.soul_size}")
        expect(page).to_not have_content("Loot: #{mon_2.loot}")
      end
    end
  end
end