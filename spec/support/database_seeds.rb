require_relative '../../db/seeds/create_grand_alliances'

RSpec.configure do |config|
  config.before(:suite) do
    Seeds::CreateGrandAlliances.new.call
  end
end
