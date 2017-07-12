module Admin::Controllers::GrandAlliances
  class Index
    include Admin::Action

    expose :grand_alliances

    def call(params)
      @grand_alliances = GrandAllianceRepository.new.all
    end
  end
end
