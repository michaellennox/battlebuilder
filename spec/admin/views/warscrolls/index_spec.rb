require 'spec_helper'

RSpec.describe Admin::Views::Warscrolls::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/warscrolls/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
end
