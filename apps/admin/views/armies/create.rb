module Admin::Views::Armies
  class Create
    include Admin::View
    template 'armies/new'

    def grand_alliance_names
      Hash[grand_alliances.map { |ga| [ga.name, ga.name] }]
    end
  end
end
