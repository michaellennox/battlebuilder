module Admin::Views::Warscrolls
  class Edit
    include Admin::View

    def army_names
      Hash[armies.map { |army| [army.name, army.id] }]
    end
  end
end
