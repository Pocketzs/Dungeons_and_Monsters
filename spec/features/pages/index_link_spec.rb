require 'rails_helper'

RSpec.describe 'Monsters Link', type: :feature do
  describe 'As a user' do
    describe 'When I visit any page on the site' do
      before :each do
      @dungeon_1 = Dungeon.create!(
          name: "Blackreach", 
          kind: "Dwemer Ruins", 
          hold: "Winterhold", 
          cleared: false, 
          visit_count: 29
        )
        @dun_1_mon_1 = @dungeon_1.monsters.create!(
          name: "Falmer",
          dead: false,
          health: 180,
          level: 9,
          soul_size: "Common",
          loot: "Falmer War Axe"
        )  
      end

      it 'Then I see a link at the top of the page that takes me to the Monsters Index' do
        visit "/dungeons"
        expect(page).to have_link('Monsters Index', href: '/monsters')
        save_and_open_page
        visit "/dungeons/#{@dungeon_1.id}"
        expect(page).to have_link('Monsters Index', href: '/monsters')
        save_and_open_page
      end
    end
  end
end