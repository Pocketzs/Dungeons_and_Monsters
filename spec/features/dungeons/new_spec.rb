require 'rails_helper'

RSpec.describe "New Dungeon Form" do
  describe 'As a user' do
    describe "When I visit '/dungeons/new'" do
      describe "When I fill out the form with a new dungeon's attributes:" do
        describe "And I click the button 'Create Parent' to submit the form" do
          it "I can create a new Dungeon and am redirected to the Dungeons Index page where I see the new Dungeon" do
            visit 'dungeons/new'

            fill_in('Name', with: 'Greywater Grotto')
            select('Cave', from: 'Type')
            select('Falkreath Hold', from: 'Hold')
            select(false, from: 'Cleared?')
            fill_in('Visit Count', with: 0)
            click_button('Create Dungeon')

            expect(current_path).to eq('/dungeons')
            expect(page).to have_content('Greywater Grotto')
          end

        end
      end
    end
  end
end