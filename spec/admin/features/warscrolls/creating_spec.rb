require 'features_helper'

describe 'Creating a warscroll' do
  let(:army_repository) { ArmyRepository.new }

  before do
    army_repository.create(FactoryGirl.build(:army, name: 'Stormcast Eternals'))
  end

  it 'can be reached via the warscrolls list page' do
    visit '/admin/warscrolls'

    click_link 'New Warscroll'

    aggregate_failures do
      expect(current_path).to eq '/admin/warscrolls/new'
      expect(page).to have_content 'New Warscroll'
    end
  end

  context 'with valid parameters' do
    xit 'creates a warscroll when the form is submitted' do
      visit '/admin/warscrolls/new'

      within '#warscroll-form' do
        select 'Stormcast Eternals', from: 'warscroll[army_id]'
        fill_in 'warscroll[name]', with: 'Liberators'

        click_button 'Create Warscroll'
      end

      aggregate_failures do
        expect(current_path).to eq '/admin/warscrolls'
        expect(page).to have_content 'Liberators'
      end
    end
  end

  context 'with invalid parameters' do
    it 'returns to the edit form with notifications of what is wrong' do
      visit '/admin/warscrolls/new'

      within '#warscroll-form' do
        select 'Stormcast Eternals', from: 'warscroll[army_id]'

        click_button 'Create Warscroll'
      end

      aggregate_failures do
        expect(page).to have_css('form#warscroll-form')
        expect(page).to have_content('Name must be filled')
      end
    end
  end
end
