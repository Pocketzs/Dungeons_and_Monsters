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

      it 'Then I see that records are ordered by most recently created first' do
        visit "/dungeons"

        expect(@dungeon_4.name).to appear_before(@dungeon_3.name)
        expect(@dungeon_3.name).to appear_before(@dungeon_2.name)
        expect(@dungeon_2.name).to appear_before(@dungeon_1.name)
      end

      it 'Then next to each of the records I see when it was created' do
        visit "/dungeons"

        expect(page).to have_content("Created at: #{@dungeon_1.created_at}")
        expect(page).to have_content("Created at: #{@dungeon_2.created_at}")
        expect(page).to have_content("Created at: #{@dungeon_3.created_at}")
        expect(page).to have_content("Created at: #{@dungeon_4.created_at}")
      end

      it 'Then I see a link to create a new Dungeon record, "New Dungeon"' do
        visit "/dungeons"

        expect(page).to have_link("New Dungeon", href: "/dungeons/new")
      end

      describe "When I click this link" do
        it "Then I am taken to '/dungeons/new' where I see a form for a new dungeon" do
          visit "/dungeons"
          click_link("New Dungeon")

          expect(current_path).to eq("/dungeons/new")

          expect(page).to have_field('Name')
          expect(page).to have_field('Type')
          expect(page).to have_field('Hold')
          expect(page).to have_field('Cleared?')
          expect(page).to have_field('Visit Count')
          expect(page).to have_button('Create Dungeon')
        end
      end

      it "Next to every dungeon I see a link to edit that dungeon's info" do
        visit "/dungeons"

        expect(page).to have_link("Edit", href: "/dungeons/#{@dungeon_1.id}/edit")
        expect(page).to have_link("Edit", href: "/dungeons/#{@dungeon_2.id}/edit")
        expect(page).to have_link("Edit", href: "/dungeons/#{@dungeon_3.id}/edit")
        expect(page).to have_link("Edit", href: "/dungeons/#{@dungeon_4.id}/edit")

        click_link("Edit", href: "/dungeons/#{@dungeon_1.id}/edit")

        expect(current_path).to eq("/dungeons/#{@dungeon_1.id}/edit")
      end

      it 'Next to every dungeon I see a link to delete that dungeon' do
        visit "/dungeons"

        expect(page).to have_link("Delete", href: "/dungeons/#{@dungeon_1.id}")
        expect(page).to have_link("Delete", href: "/dungeons/#{@dungeon_2.id}")
        expect(page).to have_link("Delete", href: "/dungeons/#{@dungeon_3.id}")
        expect(page).to have_link("Delete", href: "/dungeons/#{@dungeon_4.id}")

        click_link("Delete", href: "/dungeons/#{@dungeon_1.id}")

        expect(current_path).to eq('/dungeons')
        expect(page).to_not have_content(@dungeon_1.name)
      end
    end
  end
end
