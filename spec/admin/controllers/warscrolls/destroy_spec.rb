require_relative '../../../../apps/admin/controllers/warscrolls/destroy'

RSpec.describe Admin::Controllers::Warscrolls::Destroy do
  let(:action) { described_class.new(warscroll_repository: warscroll_repository) }
  let(:params) { Hash[id: warscroll.id] }

  let(:warscroll_repository) { instance_double(ArmyRepository, delete: nil) }
  let(:warscroll) { FactoryGirl.build(:warscroll, id: SecureRandom.uuid) }

  it 'redirects' do
    response = action.call(params)
    expect(response[0]).to eq 302
  end

  it 'destroys the relevant army' do
    action.call(params)
    expect(warscroll_repository).to have_received(:delete).with(warscroll.id)
  end
end
