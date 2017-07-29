require 'spec_helper'

RSpec.describe Admin::Controllers::Warscrolls::Edit do
  let(:action) do
    described_class.new(
      army_repository: army_repository,
      warscroll_repository: warscroll_repository
    )
  end
  let(:params) { Hash[id: warscroll.id] }

  let(:warscroll_repository) { instance_double(WarscrollRepository) }
  let(:warscroll) { FactoryGirl.build(:warscroll, id: SecureRandom.uuid, name: 'Libs') }

  let(:army_repository) { instance_double(ArmyRepository, all: armies) }
  let(:armies) do
    [
      FactoryGirl.build(:army, name: 'Stormcast'),
      FactoryGirl.build(:army, name: 'ANOtherArmy')
    ]
  end

  before do
    allow(warscroll_repository).to receive(:find)
      .with(warscroll.id)
      .and_return(warscroll)
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes the warscroll' do
    action.call(params)
    expect(action.exposures[:warscroll]).to eq warscroll
  end

  it 'exposes the armies' do
    action.call(params)
    expect(action.exposures[:armies]).to eq armies
  end
end
