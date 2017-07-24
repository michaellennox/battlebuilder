module Admin::Controllers::Warscrolls
  class New
    include Admin::Action

    expose :armies

    def initialize(army_repository: ArmyRepository.new)
      @army_repository = army_repository
    end

    def call(params)
      @armies = army_repository.all
    end

    private

    attr_reader :army_repository
  end
end
