module Admin::Controllers::Warscrolls
  class Index
    include Admin::Action

    expose :warscrolls, :armies

    params do
      optional(:army_id).filled
    end

    def initialize(
        warscroll_repository: WarscrollRepository.new,
        army_repository: ArmyRepository.new
      )
      @warscroll_repository = warscroll_repository
      @army_repository = army_repository
    end

    def call(params)
      @armies = army_repository.all
      @warscrolls = filtered_warscrolls_or_all(params[:army_id])
    end

    private

    attr_reader :warscroll_repository, :army_repository

    def filtered_warscrolls_or_all(army_id)
      if army_id
        warscroll_repository.all_with_army_by_army_id(army_id)
      else
        warscroll_repository.all_with_army
      end
    end
  end
end
