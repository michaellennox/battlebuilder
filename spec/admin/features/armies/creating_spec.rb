require 'features_helper'

describe 'Creating an army' do
  it 'can be reached via the armies list page' do
    visit '/admin/armies'

    click_link 'New Army'

    aggregate_failures do
      expect(current_path).to eq '/admin/armies/new'
      expect(page).to have_content 'New Army'
    end
  end

  context 'with valid parameters' do
    it 'creates an army when the form is submitted' do
      visit '/admin/armies/new'

      within '#army-form' do
        select 'Order', from: 'army[grand_alliance_name]'
        fill_in 'army[name]', with: 'Stormcast Eternals'

        click_button 'Create Army'
      end

      aggregate_failures do
        expect(current_path).to eq '/admin/armies'
        expect(page).to have_content 'Stormcast Eternals'
      end
    end
  end

  context 'with invalid parameters' do
    it 'returns to the edit form with notifications of what is wrong' do
      visit '/admin/armies/new'

      within '#army-form' do
        select 'Order', from: 'army[grand_alliance_name]'

        click_button 'Create Army'
      end

      aggregate_failures do
        expect(page).to have_css('form#army-form')
        expect(page).to have_content('Name must be filled')
      end
    end
  end
end
