RSpec.configure do |config|
  config.before(:suite) do
    Seeds::CreateGrandAlliances.new.call
  end
end
