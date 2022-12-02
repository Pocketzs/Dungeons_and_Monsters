require 'rails_helper'

RSpec.describe "Dungeons Index", type: :feature do
  describe 'As a user' do
    describe 'When I visit /dungeons' do
      it "Then I see each dungeon's name" do
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
        expect(page).to have_content(dungeon_2.name)
      end
    end
  end
end
