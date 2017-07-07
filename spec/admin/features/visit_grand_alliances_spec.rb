require 'features_helper'

describe 'Visit grand alliances' do
  it 'displays the grand alliances' do
    visit '/admin/grand_alliances'

    within '#grand_alliances' do
      aggregate_failures do
        expect(page).to have_content('Order')
        expect(page).to have_content('Chaos')
        expect(page).to have_content('Destruction')
        expect(page).to have_content('Death')
      end
    end
  end
end
