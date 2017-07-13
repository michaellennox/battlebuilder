module Seeds
  class CreateGrandAlliances
    def initialize(repository = GrandAllianceRepository.new)
      @repository = repository
    end

    def call
      ['Order', 'Chaos', 'Destruction', 'Death'].each(&method(:create_if_new))
    end

    private

    attr_reader :repository

    def create_if_new(name)
      return if repository.find(name)

      repository.create(name: name)
    end
  end
end
