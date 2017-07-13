namespace :seeds do
  task create_grand_alliances: :environment do
    require_relative 'create_grand_alliances'
    ::Seeds::CreateGrandAlliances.new.call
  end
end
