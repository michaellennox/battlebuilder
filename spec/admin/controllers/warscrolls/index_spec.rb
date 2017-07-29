require 'spec_helper'

RSpec.describe Admin::Controllers::Warscrolls::Index do
  let(:action) do
    described_class.new(
      warscroll_repository: warscroll_repository,
      army_repository: army_repository
    )
  end
  let(:params) { Hash[] }

  let(:warscroll_repository) { instance_double(WarscrollRepository, all_with_army: warscrolls) }
  let(:warscrolls) do
    [
      FactoryGirl.build(:warscroll, name: 'Liberators'),
      FactoryGirl.build(:warscroll, name: 'Wrathmongers')
    ]
  end

  let(:army_repository) { instance_double(ArmyRepository, all: armies) }
  let(:armies) do
    [
      FactoryGirl.build(:army, name: 'Stormcast Eternals'),
      FactoryGirl.build(:army, name: 'Fyreslayers')
    ]
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes the armies' do
    action.call(params)
    expect(action.exposures[:armies]).to eq armies
  end

  context 'when params are blank' do
    it 'exposes all warscrolls' do
      action.call(params)
      expect(action.exposures[:warscrolls]).to eq warscrolls
    end
  end

  context 'when params include an army id' do
    let(:params) { Hash[army_id: SecureRandom.uuid] }
    let(:filtered_warscrolls) do
      [
        FactoryGirl.build(:warscroll, name: 'Liberators')
      ]
    end

    before do
      allow(warscroll_repository)
        .to receive(:all_with_army_by_army_id)
        .with(params[:army_id])
        .and_return(filtered_warscrolls)
    end

    it 'exposes the warscrolls filtered' do
      action.call(params)
      expect(action.exposures[:warscrolls]).to eq filtered_warscrolls
    end
  end
end
