module Admin::Controllers::Warscrolls
  class Update
    include Admin::Action

    expose :armies, :warscroll

    params do
      required(:id).filled

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
        warscroll_repository.update(params[:id], params[:warscroll])

        redirect_to routes.warscrolls_path
      end

      @warscroll = Warscroll.new(params[:warscroll].merge(id: params[:id]))
      @armies = army_repository.all
      self.status = 422
    end

    private

    attr_reader :army_repository, :warscroll_repository
  end
end
