require 'spec_helper'

RSpec.describe Admin::Controllers::Warscrolls::Update do
  let(:action) do
    described_class.new(
      army_repository: army_repository,
      warscroll_repository: warscroll_repository
    )
  end
  let(:warscroll_repository) { instance_double(WarscrollRepository, update: nil) }
  let(:warscroll) { FactoryGirl.build(:warscroll, id: SecureRandom.uuid) }

  let(:army_repository) { instance_double(ArmyRepository, all: armies) }
  let(:armies) { [ FactoryGirl.build(:army, id: SecureRandom.uuid) ] }

  context 'when the parameters are valid' do
    let(:params) do
      Hash[
        id: warscroll.id,
        warscroll: {
          army_id: armies[0].id,
          name: 'Libs'
        }
      ]
    end

    it 'redirects' do
      response = action.call(params)
      expect(response[0]).to eq 302
    end

    it 'modifies the warscroll' do
      action.call(params)
      expect(warscroll_repository).to have_received(:update)
        .with(params[:id], params[:warscroll])
    end
  end

  context 'when the parameters are invalid' do
    let(:params) do
      Hash[
        id: warscroll.id,
        warscroll: {
          army_id: armies[0].id,
          name: ''
        }
      ]
    end

    it 'is unprocessable' do
      response = action.call(params)
      expect(response[0]).to eq 422
    end

    it 'exposes the armies' do
      action.call(params)
      expect(action.exposures[:armies]).to eq armies
    end

    it 'does not update the warscroll' do
      action.call(params)
      expect(warscroll_repository).not_to have_received(:update)
    end

    it 'exposes the warscroll' do
      action.call(params)
      warscroll = action.exposures[:warscroll]

      aggregate_failures do
        expect(warscroll.id).to eq params[:id]
        expect(warscroll.army_id).to eq params[:warscroll][:army_id]
        expect(warscroll.name).to eq params[:warscroll][:name]
      end
    end
  end
end
