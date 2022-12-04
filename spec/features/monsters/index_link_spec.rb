require 'rails_helper'

RSpec.describe 'Monsters Link', type: :feature do
  describe 'As a user' do
    describe 'When I visit any page on the site' do
      it 'Then I see a link at the top of the page that takes me to the Monsters Index' do
        visit "/dungeons"
        
        expect(page).to have_link('Monsters Index', href: '/monsters')
      end
    end
  end
end