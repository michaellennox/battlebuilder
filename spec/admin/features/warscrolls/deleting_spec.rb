require 'features_helper'

describe 'Deleting a warscroll' do
  let(:warscroll_repository) { WarscrollRepository.new }
  let(:army_repository) { ArmyRepository.new }

  let!(:army) { army_repository.create(FactoryGirl.build(:army)) }
  let!(:warscroll) { warscroll_repository.create(FactoryGirl.build(:warscroll, army_id: army.id)) }

  it 'clicking the delete button deletes an army' do
    visit '/admin/warscrolls'

    within '#warscrolls' do
      click_button 'Delete'
    end

    aggregate_failures do
      expect(current_path).to eq '/admin/warscrolls'
      expect(page).not_to have_content(warscroll.name)
    end
  end
end
