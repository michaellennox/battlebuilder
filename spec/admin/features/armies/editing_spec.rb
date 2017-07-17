require 'features_helper'

describe 'Editing an army' do
  let(:army_repository) { ArmyRepository.new }

  let!(:army) { army_repository.create(FactoryGirl.build(:army)) }

  it 'can navigate to the editing page from the list view' do
    visit '/admin/armies'

    within '#armies' do
      click_link 'Edit'
    end

    aggregate_failures do
      expect(current_path).to eq "/admin/armies/#{army.id}/edit"
      expect(page).to have_selector('input[value="Stormcast Eternals"]')
    end
  end

  it 'allows modification of an army details' do
    visit "/admin/armies/#{army.id}/edit"

    within '#army-form' do
      fill_in 'army[name]', with: 'Stormcast Newnames'

      click_button 'Update Army'
    end

    aggregate_failures do
      expect(current_path).to eq '/admin/armies'
      expect(page).to have_content('Stormcast Newnames')
      expect(page).not_to have_content(army.name)
    end
  end
end
