require 'spec_helper'

RSpec.describe WarscrollRepository do
  let(:warscroll_repository) { WarscrollRepository.new }
  let(:army_repository) { ArmyRepository.new }

  describe '#all_with_army' do
    it 'returns all warscrolls with their relevant army as entities' do
      sce = army_repository.create(FactoryGirl.build(:army, name: 'Stormcast Eternals'))
      kbb = army_repository.create(FactoryGirl.build(:army, name: 'Khorne Bloodbound'))

      liberators = warscroll_repository.create(
        FactoryGirl.build(:warscroll, army_id: sce.id, name: 'Liberators')
      )
      wrathmongers = warscroll_repository.create(
        FactoryGirl.build(:warscroll, army_id: kbb.id, name: 'Wrathmongers')
      )

      result = warscroll_repository.all_with_army
      result_libs = result.find { |warscroll| warscroll.name == 'Liberators' }
      result_wraths = result.find { |warscroll| warscroll.name == 'Wrathmongers' }

      aggregate_failures do
        expect(result_libs).to eq(liberators)
        expect(result_wraths).to eq(wrathmongers)

        expect(result_libs.army).to eq(sce)
        expect(result_wraths.army).to eq(kbb)
      end
    end
  end

  describe '#all_with_army_by_army_id' do
    it 'returns all warscrolls with their relevant army filtered by army_id' do
      sce = army_repository.create(FactoryGirl.build(:army, name: 'Stormcast Eternals'))
      kbb = army_repository.create(FactoryGirl.build(:army, name: 'Khorne Bloodbound'))

      liberators = warscroll_repository.create(
        FactoryGirl.build(:warscroll, army_id: sce.id, name: 'Liberators')
      )
      wrathmongers = warscroll_repository.create(
        FactoryGirl.build(:warscroll, army_id: kbb.id, name: 'Wrathmongers')
      )

      result = warscroll_repository.all_with_army_by_army_id(sce.id)
      result_libs = result.find { |warscroll| warscroll.name == 'Liberators' }

      aggregate_failures do
        expect(result).not_to include(wrathmongers)
        expect(result_libs).to eq(liberators)

        expect(result_libs.army).to eq(sce)
      end
    end
  end
end
