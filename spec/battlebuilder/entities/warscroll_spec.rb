require 'spec_helper'

RSpec.describe Warscroll do
  describe '#to_json' do
    it 'converts itself and nested entites to json' do
      army = FactoryGirl.build(:army)
      warscroll = FactoryGirl.build(:warscroll, army: army)

      json = warscroll.to_json
      result = JSON.parse(json)

      expect(result['name']).to eq warscroll.name
      expect(result['army']).to eq army.to_h.stringify_keys
    end
  end
end
