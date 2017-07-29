require_relative '../../../../apps/admin/controllers/warscrolls/show'

RSpec.describe Admin::Controllers::Warscrolls::Show do
  let(:action) { described_class.new(warscroll_repository: warscroll_repository) }
  let(:params) { Hash[id: warscroll.id] }

  let(:warscroll) { FactoryGirl.build(:warscroll, id: SecureRandom.uuid) }
  let(:warscroll_repository) { instance_double(WarscrollRepository) }

  before do
    allow(warscroll_repository)
      .to receive(:find)
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
end
