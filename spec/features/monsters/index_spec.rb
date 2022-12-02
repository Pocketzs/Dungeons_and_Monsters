require 'rails_helper'

RSpec.describe "Monsters Index", type: :feature do
  describe 'As a user' do
    describe "When I visit '/monsters'" do
      it "Then I see each monster in the system including the monster's attributes" do
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
          dead: false,
          health: 253,
          level: 12,
          soul_size: "Lesser",
          loot: "Chaurus Chitin"
        )
        mon_3 = Monster.create!(
          name: "Dwarven Centurion",
          dead: true,
          health: 653,
          level: 24,
          soul_size: "Grand",
          loot: "Centurion Dynamo Core"
        )
        mon_4 = Monster.create!(
          name: "Frostbite Spider",
          dead: true,
          health: 220,
          level: 8,
          soul_size: "Petty",
          loot: "Frostbite Venom"
        )

        visit "/monsters"
        save_and_open_page
        expect(page).to have_content(mon_1.name)
        expect(page).to have_content("Dead?: #{mon_1.dead}")
        expect(page).to have_content("Health: #{mon_1.health}")
        expect(page).to have_content("Level: #{mon_1.level}")
        expect(page).to have_content("Soul Size: #{mon_1.soul_size}")
        expect(page).to have_content("Loot: #{mon_1.loot}")
        expect(page).to have_content(mon_2.name)
        expect(page).to have_content("Dead?: #{mon_2.dead}")
        expect(page).to have_content("Health: #{mon_2.health}")
        expect(page).to have_content("Level: #{mon_2.level}")
        expect(page).to have_content("Soul Size: #{mon_2.soul_size}")
        expect(page).to have_content("Loot: #{mon_2.loot}")
        expect(page).to have_content(mon_3.name)
        expect(page).to have_content("Dead?: #{mon_3.dead}")
        expect(page).to have_content("Health: #{mon_3.health}")
        expect(page).to have_content("Level: #{mon_3.level}")
        expect(page).to have_content("Soul Size: #{mon_3.soul_size}")
        expect(page).to have_content("Loot: #{mon_3.loot}")
        expect(page).to have_content(mon_4.name)
        expect(page).to have_content("Dead?: #{mon_4.dead}")
        expect(page).to have_content("Health: #{mon_4.health}")
        expect(page).to have_content("Level: #{mon_4.level}")
        expect(page).to have_content("Soul Size: #{mon_4.soul_size}")
        expect(page).to have_content("Loot: #{mon_4.loot}")
      end
    end
  end
end