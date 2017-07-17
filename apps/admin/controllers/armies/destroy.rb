module Admin::Controllers::Armies
  class Destroy
    include Admin::Action

    def call(params)
      ArmyRepository.new.delete(params[:id])

      redirect_to routes.armies_path
    end
  end
end
