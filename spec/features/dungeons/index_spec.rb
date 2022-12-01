require 'rails_helper'

RSpec.describe "Dungeons Index", type: :feature do
  describe 'As a user' do
    describe 'When I visit /dungeons' do
      it "Then I see the name of each dungeon's name, type, and hold" do
        dungeon_1 = Dungeon.create!(
          name: "Blackreach", 
          type: "Dwemer Ruins", 
          hold: "Winterhold", 
          cleared: false, 
          visit_count: 29
        )

        dungeons_2 = Dungeon.create!(
          name: "Forsaken Cave",
          type: "Cave",
          hold: "The Pale",
          cleared: true,
          visit_count: 30
        )
        
        visit "/dungeons" 

        
      end
    end
  end
end