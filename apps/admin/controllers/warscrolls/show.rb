module Admin::Controllers::Warscrolls
  class Show
    include Admin::Action

    expose :warscroll

    def initialize(warscroll_repository: WarscrollRepository.new)
      @warscroll_repository = warscroll_repository
    end

    def call(params)
      @warscroll = warscroll_repository.find_with_army(params[:id])
    end

    private

    attr_reader :warscroll_repository
  end
end
