module Admin::Views::Armies
  class Edit
    include Admin::View

    def grand_alliance_names
      Hash[grand_alliances.map { |ga| [ga.name, ga.name] }]
    end
  end
end
