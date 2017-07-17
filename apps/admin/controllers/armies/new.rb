module Admin::Controllers::Armies
  class New
    include Admin::Action

    expose :grand_alliances

    def call(params)
      @grand_alliances = GrandAllianceRepository.new.all
    end
  end
end
