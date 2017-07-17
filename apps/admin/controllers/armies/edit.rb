module Admin::Controllers::Armies
  class Edit
    include Admin::Action

    expose :army, :grand_alliances

    def call(params)
      @army = ArmyRepository.new.find(params[:id])
      @grand_alliances = GrandAllianceRepository.new.all
    end
  end
end
