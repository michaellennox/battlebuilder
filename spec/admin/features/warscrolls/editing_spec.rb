require 'features_helper'

describe 'Editing a warscroll' do
  let(:army_repository) { ArmyRepository.new }
  let(:warscroll_repository) { WarscrollRepository.new }

  let!(:army) { army_repository.create(FactoryGirl.build(:army)) }
  let!(:warscroll) do
    warscroll_repository.create(
      FactoryGirl.build(:warscroll, name: 'Liberators', army_id: army.id)
    )
  end

  it 'can navigate to the editing page from the list view' do
    visit '/admin/warscrolls'

    within '#warscrolls' do
      click_link 'Edit'
    end

    aggregate_failures do
      expect(current_path).to eq "/admin/warscrolls/#{warscroll.id}/edit"
      expect(page).to have_selector('input[value="Liberators"]')
    end
  end

  it 'allows modification of a warscroll details' do
    visit "/admin/warscrolls/#{warscroll.id}/edit"

    within '#warscroll-form' do
      fill_in 'warscroll[name]', with: 'NotALiberator'

      click_button 'Update Warscroll'
    end

    aggregate_failures do
      expect(current_path).to eq '/admin/warscrolls'
      expect(page).to have_content('NotALiberator')
      expect(page).not_to have_content('Liberators')
    end
  end
end
