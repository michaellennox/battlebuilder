require 'spec_helper'
require_relative '../../../../apps/admin/views/grand_alliances/index'

RSpec.describe Admin::Views::GrandAlliances::Index do
  let(:exposures) { Hash[grand_alliances: grand_alliances] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/grand_alliances/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  let(:grand_alliances) do
    [
      double(GrandAlliance, name: 'Chaos'),
      double(GrandAlliance, name: 'Order'),
      double(GrandAlliance, name: 'Destruction'),
      double(GrandAlliance, name: 'Death')
    ]
  end

  it 'renders the grand alliance names' do
    aggregate_failures do
      expect(rendered).to include('<h2>Order</h2>')
      expect(rendered).to include('<h2>Chaos</h2>')
      expect(rendered).to include('<h2>Destruction</h2>')
      expect(rendered).to include('<h2>Death</h2>')
    end
  end
end
