require 'rails_helper'

RSpec.describe "Dungeons Index", type: :feature do
  describe 'As a user' do
    describe 'When I visit /dungeons' do
      it "Then I see the name of each dungeon's name, kind, and hold" do
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
        
        visit "/dungeons" 
        save_and_open_page
        expect(page).to have_content(dungeon_1.name)
        expect(page).to have_content("Type: #{dungeon_1.kind}")
        expect(page).to have_content("Hold: #{dungeon_1.hold}")
        expect(page).to have_content(dungeon_2.name)
        expect(page).to have_content("Type: #{dungeon_2.kind}")
        expect(page).to have_content("Hold: #{dungeon_2.hold}")
      end
    end
  end
end