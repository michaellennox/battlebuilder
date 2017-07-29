module Admin::Controllers::Warscrolls
  class Create
    include Admin::Action

    expose :armies

    params do
      required(:warscroll).schema(Admin::Schemas::WarscrollParams)
    end

    def initialize(
      army_repository: ArmyRepository.new,
      warscroll_repository: WarscrollRepository.new
    )
      @army_repository = army_repository
      @warscroll_repository = warscroll_repository
    end

    def call(params)
      if params.valid?
        warscroll = warscroll_repository.create(params[:warscroll])

        redirect_to routes.warscroll_path(warscroll.id)
      end

      @armies = army_repository.all
      self.status = 422
    end

    private

    attr_reader :warscroll_repository, :army_repository
  end
end
