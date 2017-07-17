module Admin::Views::Armies
  class Update
    include Admin::View
    template 'armies/edit'

    def grand_alliance_names
      Hash[grand_alliances.map { |ga| [ga.name, ga.name] }]
    end
  end
end
