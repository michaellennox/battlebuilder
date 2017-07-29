module Admin::Views::Warscrolls
  class New
    include Admin::View

    def army_names
      Hash[armies.map { |army| [army.name, army.id] }]
    end
  end
end
