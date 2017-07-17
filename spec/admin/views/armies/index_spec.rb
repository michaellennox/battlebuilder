require 'spec_helper'

RSpec.describe Admin::Views::Armies::Index do
  let(:exposures) { Hash[armies: []] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/armies/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }
end
