require 'spec_helper'

RSpec.describe Admin::Controllers::Armies::Destroy do
  let(:action) { described_class.new }
  let(:params) { Hash[id: army.id] }

  let(:army_repository) { instance_double(ArmyRepository, delete: nil) }
  let(:army) { FactoryGirl.build(:army, id: SecureRandom.uuid) }

  before do
    allow(ArmyRepository).to receive(:new).and_return(army_repository)
  end

  it 'redirects' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end

  it 'destroys the relevant army' do
    action.call(params)
    expect(army_repository).to have_received(:delete).with(army.id)
  end
end
