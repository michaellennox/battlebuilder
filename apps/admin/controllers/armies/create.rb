module Admin::Controllers::Armies
  class Create
    include Admin::Action

    expose :grand_alliances

    params do
      required(:army).schema do
        required(:grand_alliance_name).filled(:str?)
        required(:name).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        ArmyRepository.new.create(params[:army])

        redirect_to routes.armies_path
      end

      @grand_alliances = GrandAllianceRepository.new.all
      self.status = 422
    end
  end
end
