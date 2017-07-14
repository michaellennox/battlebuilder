require 'spec_helper'
require_relative '../../../../apps/admin/controllers/grand_alliances/index'

RSpec.describe Admin::Controllers::GrandAlliances::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:exposures) { action.exposures }

  let(:grand_alliances) do
    [
      FactoryGirl.build(:grand_alliance, :order),
      FactoryGirl.build(:grand_alliance, :chaos)
    ]
  end
  let(:grand_alliance_repository) do
    instance_double(GrandAllianceRepository, all: grand_alliances)
  end

  before do
    allow(GrandAllianceRepository)
      .to receive(:new)
      .and_return(grand_alliance_repository)
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes the grand alliances' do
    action.call(params)
    expect(exposures[:grand_alliances]).to eq grand_alliances
  end
end
