require 'features_helper'

describe 'Visit armies' do
  let(:repository) { ArmyRepository.new }

  before do
    repository.create(FactoryGirl.build(:army, name: 'Stormcast Eternals', grand_alliance_name: 'Order'))
    repository.create(FactoryGirl.build(:army, name: 'Khorne Bloodbound', grand_alliance_name: 'Chaos'))
  end

  it 'displays the armies' do
    visit '/admin/armies'

    within '#armies' do
      aggregate_failures do
        expect(page).to have_content('Stormcast Eternals')
        expect(page).to have_content('Khorne Bloodbound')
      end
    end
  end

  it 'can be filtered by grand alliance name' do
    visit '/admin/armies'

    select 'Order', from: 'grand_alliance_name'
    click_button 'Filter'

    within '#armies' do
      aggregate_failures do
        expect(page).not_to have_content('Khorne Bloodbound')
        expect(page).to have_content('Stormcast Eternals')
      end
    end
  end
end
