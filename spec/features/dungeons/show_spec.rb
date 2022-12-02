require 'rails_helper'

RSpec.describe "Dungeons Show", type: :feature do
  describe 'As a user' do
    describe 'When I visit /dungeons/:id' do
      it "Then I see the dungeon with corresponding id and its attributes" do
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
        
        visit "/dungeons/#{dungeon_1.id}" 
        save_and_open_page
        expect(page).to have_content(dungeon_1.name)
        expect(page).to have_content("Type: #{dungeon_1.kind}")
        expect(page).to have_content("Hold: #{dungeon_1.hold}")
        expect(page).to have_content("Cleared?: #{dungeon_1.cleared}")
        expect(page).to have_content("Visit Count: #{dungeon_1.visit_count}")
        expect(page).to_not have_content(dungeon_2.name)
        expect(page).to_not have_content("Type: #{dungeon_2.kind}")
        expect(page).to_not have_content("Hold: #{dungeon_2.hold}")
        expect(page).to_not have_content("Cleared?: #{dungeon_2.cleared}")
        expect(page).to_not have_content("Visit Count: #{dungeon_2.visit_count}")
      end
    end
  end
end