require 'features_helper'

describe 'Deleting an army' do
  let(:army_repository) { ArmyRepository.new }

  let!(:army) { army_repository.create(FactoryGirl.build(:army)) }

  it 'clicking the delete button deletes an army' do
    visit '/admin/armies'

    within '#armies' do
      click_button 'Delete'
    end

    aggregate_failures do
      expect(current_path).to eq '/admin/armies'
      expect(page).not_to have_content(army.name)
    end
  end
end
