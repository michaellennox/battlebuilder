require 'spec_helper'

RSpec.describe Admin::Controllers::Armies::Edit do
  let(:action) { described_class.new }
  let(:params) { Hash[id: army.id] }

  let(:army_repository) { instance_double(ArmyRepository) }
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
    allow(army_repository).to receive(:find).with(army.id).and_return(army)
    allow(GrandAllianceRepository).to receive(:new).and_return(grand_alliance_repository)
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes the army' do
    action.call(params)
    expect(action.exposures[:army]).to eq army
  end

  it 'exposes the grand alliances' do
    action.call(params)
    expect(action.exposures[:grand_alliances]).to eq grand_alliances
  end
end
