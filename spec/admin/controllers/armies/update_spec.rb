require 'spec_helper'

RSpec.describe Admin::Controllers::Armies::Update do
  let(:action) { described_class.new }

  let(:army_repository) { instance_double(ArmyRepository, update: nil) }
  let(:army) { FactoryGirl.build(:army, id: SecureRandom.uuid) }

  let(:grand_alliance_repository) { instance_double(GrandAllianceRepository, all: grand_alliances) }
  let(:grand_alliances) do
    [
      FactoryGirl.build(:grand_alliance, :order),
      FactoryGirl.build(:grand_alliance, :chaos)
    ]
  end

  before do
    allow(ArmyRepository).to receive(:new).and_return(army_repository)
    allow(GrandAllianceRepository).to receive(:new).and_return(grand_alliance_repository)
  end

  context 'when the parameters are valid' do
    let(:params) do
      Hash[
        id: army.id,
        army: {
          grand_alliance_name: 'Order',
          name: 'Stormcast Eternals'
        }
      ]
    end

    it 'redirects' do
      response = action.call(params)
      expect(response[0]).to eq 302
    end

    it 'modifies the army' do
      action.call(params)
      expect(army_repository).to have_received(:update).with(params[:id], params[:army])
    end
  end

  context 'when the parameters are invalid' do
    let(:params) do
      Hash[
        id: army.id,
        army: {
          grand_alliance_name: 'Order',
          name: ''
        }
      ]
    end

    it 'is unprocessable' do
      response = action.call(params)
      expect(response[0]).to eq 422
    end

    it 'exposes the grand alliances' do
      action.call(params)
      expect(action.exposures[:grand_alliances]).to eq grand_alliances
    end

    it 'does not update the army' do
      action.call(params)
      expect(army_repository).not_to have_received(:update)
    end

    it 'exposes the army' do
      action.call(params)
      army = action.exposures[:army]

      aggregate_failures do
        expect(army.id).to eq params[:id]
        expect(army.name).to eq params[:army][:name]
        expect(army.grand_alliance_name).to eq params[:army][:grand_alliance_name]
      end
    end
  end
end
