require 'rails_helper'

RSpec.describe "Dungeon's Monsters Index" do
  describe "As a user" do
    describe "When I visit '/dungeons/:dungeon_id/monsters" do
      it "Then I see each Monster that is associated with that Dungeon with each monster's attributes" do
        dungeon_1 = Dungeon.create!(
          name: "Blackreach", 
          kind: "Dwemer Ruins", 
          hold: "Winterhold", 
          cleared: false, 
          visit_count: 29
        )
        dungeon_2 = Dungeon.create!(
          name: "Forsaken Cave",
          kind: "Cave",
          hold: "The Pale",
          cleared: true,
          visit_count: 30
        )
        mon_1 = dungeon_1.monsters.create!(
          name: "Falmer",
          dead: false,
          health: 180,
          level: 9,
          soul_size: "Common",
          loot: "Falmer War Axe"
        )
        mon_2 = dungeon_2.monsters.create!(
          name: "Chaurus",
          dead: true,
          health: 253,
          level: 12,
          soul_size: "Lesser",
          loot: "Chaurus Chitin"
        )

        visit "/dungeons/#{dungeon_1.id}/monsters"
        # save_and_open_page
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