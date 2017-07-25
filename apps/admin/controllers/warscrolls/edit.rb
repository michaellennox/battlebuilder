module Admin::Controllers::Warscrolls
  class Edit
    include Admin::Action

    expose :warscroll, :armies

    def initialize(
      army_repository: ArmyRepository.new,
      warscroll_repository: WarscrollRepository.new
    )
      @army_repository = army_repository
      @warscroll_repository = warscroll_repository
    end

    def call(params)
      @warscroll = warscroll_repository.find(params[:id])
      @armies = army_repository.all
    end

    private

    attr_reader :army_repository, :warscroll_repository
  end
end
