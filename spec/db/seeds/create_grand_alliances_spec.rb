require 'spec_helper'
require_relative '../../../db/seeds/create_grand_alliances'

RSpec.describe Seeds::CreateGrandAlliances do
  let(:repository) { instance_double(GrandAllianceRepository) }
  before do
    allow(repository).to receive(:find)
    allow(repository).to receive(:create)
  end

  subject(:service) { described_class.new(repository) }

  context 'when all grand alliances already exist' do
    before do
      allow(repository).to receive(:find).with('Order').and_return(FactoryGirl.build(:grand_alliance, :order))
      allow(repository).to receive(:find).with('Chaos').and_return(FactoryGirl.build(:grand_alliance, :chaos))
      allow(repository).to receive(:find).with('Destruction').and_return(FactoryGirl.build(:grand_alliance, :destruction))
      allow(repository).to receive(:find).with('Death').and_return(FactoryGirl.build(:grand_alliance, :death))
    end

    it 'creates no grand alliance records' do
      service.call

      expect(repository).not_to have_received(:create)
    end
  end

  context 'when some grand alliances already exist' do
    before do
      allow(repository).to receive(:find).with('Order').and_return(FactoryGirl.build(:grand_alliance, :order))
      allow(repository).to receive(:find).with('Chaos').and_return(FactoryGirl.build(:grand_alliance, :chaos))
    end

    it 'creates the missing grand alliance records' do
      service.call

      aggregate_failures do
        expect(repository).to have_received(:create).with(name: 'Destruction')
        expect(repository).to have_received(:create).with(name: 'Death')
      end
    end
  end

  context 'when no grand alliances already exist' do
    it 'creates all the grand alliance records' do
      service.call

      aggregate_failures do
        expect(repository).to have_received(:create).with(name: 'Order')
        expect(repository).to have_received(:create).with(name: 'Chaos')
        expect(repository).to have_received(:create).with(name: 'Destruction')
        expect(repository).to have_received(:create).with(name: 'Death')
      end
    end
  end
end
