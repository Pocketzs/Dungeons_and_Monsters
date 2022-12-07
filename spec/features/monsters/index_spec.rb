require 'rails_helper'

RSpec.describe "Monsters Index", type: :feature do
  describe 'As a user' do
    describe "When I visit '/monsters'" do
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
          dead: false,
          health: 253,
          level: 12,
          soul_size: "Lesser",
          loot: "Chaurus Chitin"
        )
        @mon_3 = @dungeon_1.monsters.create!(
          name: "Dwarven Centurion",
          dead: true,
          health: 653,
          level: 24,
          soul_size: "Grand",
          loot: "Centurion Dynamo Core"
        )
        @mon_4 = @dungeon_1.monsters.create!(
          name: "Frostbite Spider",
          dead: true,
          health: 220,
          level: 8,
          soul_size: "Petty",
          loot: "Frostbite Venom"
        )
      end

      it "Then I only see dead monsters in the system including the monster's attributes" do
        visit "/monsters"
        
        expect(page).to_not have_content(@mon_1.name)
        expect(page).to_not have_content(@mon_2.name)
        expect(page).to have_content(@mon_3.name)
        expect(page).to have_content("Dead?: #{@mon_3.dead}")
        expect(page).to have_content("Health: #{@mon_3.health}")
        expect(page).to have_content("Level: #{@mon_3.level}")
        expect(page).to have_content("Soul Size: #{@mon_3.soul_size}")
        expect(page).to have_content("Loot: #{@mon_3.loot}")
        expect(page).to have_content(@mon_4.name)
        expect(page).to have_content("Dead?: #{@mon_4.dead}")
        expect(page).to have_content("Health: #{@mon_4.health}")
        expect(page).to have_content("Level: #{@mon_4.level}")
        expect(page).to have_content("Soul Size: #{@mon_4.soul_size}")
        expect(page).to have_content("Loot: #{@mon_4.loot}")
      end

      it 'Next to every monster I see a link to edit that monsters info' do
        visit "/monsters"

        expect(page).to have_link("Edit", href: "/monsters/#{@mon_3.id}/edit")
        expect(page).to have_link("Edit", href: "/monsters/#{@mon_4.id}/edit")

        click_link("Edit", href: "/monsters/#{@mon_3.id}/edit")

        expect(current_path).to eq("/monsters/#{@mon_3.id}/edit")
      end

      it 'Next to every monster I see a link to delete that monster' do
        visit '/monsters'

        expect(page).to have_link('Delete', href: "/monsters/#{@mon_3.id}")
        expect(page).to have_link('Delete', href: "/monsters/#{@mon_4.id}")

        click_link("Delete", href: "/monsters/#{@mon_3.id}")

        expect(current_path).to eq("/monsters")

        expect(page).to_not have_content(@mon_3.name)
      end
    end
  end
end