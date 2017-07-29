module Admin::Controllers::Warscrolls
  class Destroy
    include Admin::Action

    def initialize(warscroll_repository: WarscrollRepository.new)
      @warscroll_repository = warscroll_repository
    end

    def call(params)
      warscroll_repository.delete(params[:id])

      redirect_to routes.warscrolls_path
    end

    private

    attr_reader :warscroll_repository
  end
end
