require 'features_helper'

describe 'Reading the warscroll list' do
  let(:army_repository) { ArmyRepository.new }
  let(:warscroll_repository) { WarscrollRepository.new }

  before do
    sce = army_repository.create(FactoryGirl.build(:army, name: 'Stormcast Eternals', grand_alliance_name: 'Order'))
    kbb = army_repository.create(FactoryGirl.build(:army, name: 'Khorne Bloodbound', grand_alliance_name: 'Chaos'))

    warscroll_repository.create(FactoryGirl.build(:warscroll, name: 'Liberators', army_id: sce.id))
    warscroll_repository.create(FactoryGirl.build(:warscroll, name: 'Wrathmongers', army_id: kbb.id))
  end

  it 'displays the warscrolls' do
    visit '/admin/warscrolls'

    within '#warscrolls' do
      aggregate_failures do
        expect(page).to have_content('Liberators')
        expect(page).to have_content('Wrathmongers')
      end
    end
  end

  it 'can be filtered by army name' do
    visit '/admin/warscrolls'

    select 'Stormcast Eternals', from: 'army_id'
    click_button 'Filter'

    within '#warscrolls' do
      aggregate_failures do
        expect(page).to have_content('Liberators')
        expect(page).not_to have_content('Wrathmongers')
      end
    end
  end
end
