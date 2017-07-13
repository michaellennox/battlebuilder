require 'rake'
require 'hanami/rake_tasks'

import 'db/seeds/seeds.rake'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
end
