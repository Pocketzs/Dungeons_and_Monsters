require 'rails_helper'

RSpec.describe "Dungeons Index", type: :feature do
  describe 'As a user' do
    describe 'When I visit /dungeons' do
      before :each do
        Dungeon.destroy_all
        @dungeon_1 = Dungeon.create!(
          name: "Blackreach", 
          kind: "Dwemer Ruins", 
          hold: "Winterhold", 
          cleared: false, 
          visit_count: 29
        )
        @dungeon_2 = Dungeon.create!(
          name: "Forsaken Cave",
          kind: "Cave",
          hold: "The Pale",
          cleared: true,
          visit_count: 30
        )
        @dungeon_3 = Dungeon.create!(
          name: "Bleak Falls Barrow",
          kind: "Nordic Tomb",
          hold: "Falkreath Hold",
          cleared: false,
          visit_count: 3
        )
        @dungeon_4 = Dungeon.create!(
          name: "Mistwatch",
          kind: "Fort Ruin",
          hold: "Eastmarch",
          cleared: true,
          visit_count: 17
        )
      end
      it "Then I see each dungeon's name" do
        visit "/dungeons" 
        # save_and_open_page
        expect(page).to have_content(@dungeon_1.name)
        expect(page).to have_content(@dungeon_2.name)
        expect(page).to have_content(@dungeon_3.name)
        expect(page).to have_content(@dungeon_4.name)
      end

      it ' I see that records are ordered by most recently created first' do
        visit "/dungeons"
        expect(@dungeon_4.name).to appear_before(@dungeon_3.name)
        expect(@dungeon_3.name).to appear_before(@dungeon_2.name)
        expect(@dungeon_2.name).to appear_before(@dungeon_1.name)
      end

      it 'Next to each of the records I see when it was created'
    end
  end
end
