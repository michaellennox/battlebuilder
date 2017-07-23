module Admin::Controllers::Armies
  class Index
    include Admin::Action

    expose :armies, :grand_alliances

    params do
      optional(:grand_alliance_name).filled
    end

    def call(params)
      @armies = filtered_armies_or_all(params)
      @grand_alliances = GrandAllianceRepository.new.all
    end

    private

    def filtered_armies_or_all(params)
      army_repository = ArmyRepository.new
      grand_alliance_name = params[:grand_alliance_name]

      if grand_alliance_name
        army_repository.all_by_grand_alliance_name(grand_alliance_name)
      else
        army_repository.all
      end
    end
  end
end
