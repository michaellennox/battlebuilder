require 'spec_helper'

RSpec.describe Admin::Controllers::Armies::Create do
  let(:action) { described_class.new }

  let(:army_repository) { instance_double(ArmyRepository, create: nil) }

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

    it 'persists the army' do
      action.call(params)
      expect(army_repository).to have_received(:create).with(params[:army])
    end
  end

  context 'when the parameters are invalid' do
    let(:params) do
      Hash[
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

    it 'does not persist an army' do
      action.call(params)
      expect(army_repository).not_to have_received(:create)
    end
  end
end
