require 'spec_helper'

RSpec.describe ArmyRepository do
  subject(:army_repository) { ArmyRepository.new }

  describe '#all_by_grand_alliance_name' do
    let!(:sce) { army_repository.create(FactoryGirl.build(:army, name: 'Stormcast Eternals', grand_alliance_name: 'Order'))}
    let!(:kbb) { army_repository.create(FactoryGirl.build(:army, name: 'Khorne Bloodbound', grand_alliance_name: 'Chaos'))}
    let!(:fyreslayers) { army_repository.create(FactoryGirl.build(:army, name: 'Fyreslayers', grand_alliance_name: 'Order'))}

    it 'returns armies only for that grand alliance' do
      result = army_repository.all_by_grand_alliance_name('Order')

      expect(result).to include(sce)
      expect(result).to include(fyreslayers)
      expect(result).not_to include(kbb)
    end
  end
end
