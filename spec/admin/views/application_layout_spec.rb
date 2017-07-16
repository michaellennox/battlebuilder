require 'spec_helper'

RSpec.describe Admin::Views::ApplicationLayout do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/application.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  # hanami bug means rendering view in unit environment breaks with partials
  # https://github.com/hanami/view/issues/129
  xit 'renders the links to the dependencies' do
    aggregate_failures do
      expect(rendered).to include(view.bootstrap_stylesheet)
      expect(rendered).to include(view.jquery_script)
      expect(rendered).to include(view.tether_script)
      expect(rendered).to include(view.bootstrap_script)
    end
  end

  describe '#bootstrap_stylesheet' do
    it 'should return the stylesheet link for the bootstrap css' do
      expect(view.bootstrap_stylesheet).to eq(
        '<link integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" type="text/css" rel="stylesheet">'
      )
    end
  end

  describe '#jquery_script' do
    it 'should return the script tag for the jquery script' do
      expect(view.jquery_script).to eq(
        '<script integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous" src="https://code.jquery.com/jquery-3.1.1.slim.min.js" type="text/javascript"></script>'
      )
    end
  end

  describe '#tether_script' do
    it 'should return the script tag for the tether script' do
      expect(view.tether_script).to eq(
        '<script integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous" src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" type="text/javascript"></script>'
      )
    end
  end

  describe '#bootstrap_script' do
    it 'should return the script tag for the bootstrap script' do
      expect(view.bootstrap_script).to eq(
        '<script integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" type="text/javascript"></script>'
      )
    end
  end
end
