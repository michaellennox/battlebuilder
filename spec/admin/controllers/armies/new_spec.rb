require 'spec_helper'

RSpec.describe Admin::Controllers::Armies::New do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  let(:grand_alliance_repository) { instance_double(GrandAllianceRepository, all: grand_alliances)}
  let(:grand_alliances) do
    [
      FactoryGirl.build(:grand_alliance, :order),
      FactoryGirl.build(:grand_alliance, :chaos)
    ]
  end

  before do
    allow(GrandAllianceRepository).to receive(:new).and_return(grand_alliance_repository)
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all grand alliances' do
    action.call(params)
    expect(action.exposures[:grand_alliances]).to eq grand_alliances
  end
end
