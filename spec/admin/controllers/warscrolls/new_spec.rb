require 'spec_helper'

RSpec.describe Admin::Controllers::Warscrolls::New do
  let(:action) { described_class.new(army_repository: army_repository) }
  let(:params) { Hash[] }

  let(:army_repository) { instance_double(ArmyRepository, all: armies)}
  let(:armies) do
    [
      FactoryGirl.build(:army),
      FactoryGirl.build(:army)
    ]
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all armies' do
    action.call(params)
    expect(action.exposures[:armies]).to eq armies
  end
end
