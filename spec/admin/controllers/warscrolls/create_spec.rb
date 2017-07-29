require 'spec_helper'

RSpec.describe Admin::Controllers::Warscrolls::Create do
  let(:action) do
    described_class.new(
      army_repository: army_repository,
      warscroll_repository: warscroll_repository
    )
  end

  let(:warscroll_repository) { instance_double(WarscrollRepository, create: Warscroll.new(id: SecureRandom.uuid)) }

  let(:army_repository) { instance_double(ArmyRepository, all: armies) }
  let(:armies) do
    [
      FactoryGirl.build(:army, name: 'Stormcast Eternals', id: SecureRandom.uuid)
    ]
  end

  context 'when the params are valid' do
    let(:params) do
      Hash[
        warscroll: {
          army_id: armies[0].id,
          name: 'Liberators'
        }
      ]
    end

    it 'redirects' do
      response = action.call(params)
      expect(response[0]).to eq 302
    end

    it 'persists the warscroll' do
      action.call(params)
      expect(warscroll_repository).to have_received(:create).with(params[:warscroll])
    end
  end

  context 'when parameters are invalid' do
    let(:params) do
      Hash[
        warsroll: {
          army_id: SecureRandom.uuid,
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

    it 'does not persist a warscroll' do
      action.call(params)
      expect(warscroll_repository).not_to have_received(:create)
    end
  end
end
