module Admin::Controllers::Armies
  class Update
    include Admin::Action

    expose :grand_alliances, :army

    params do
      required(:id).filled

      required(:army).schema do
        required(:grand_alliance_name).filled(:str?)
        required(:name).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        ArmyRepository.new.update(params[:id], params[:army])

        redirect_to routes.armies_path
      end

      @army = Army.new(params[:army].merge(id: params[:id]))
      @grand_alliances = GrandAllianceRepository.new.all
      self.status = 422
    end
  end
end
