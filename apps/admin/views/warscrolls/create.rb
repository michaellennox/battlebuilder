module Admin::Views::Warscrolls
  class Create
    include Admin::View
    template 'warscrolls/new'

    def army_names
      Hash[armies.map { |army| [army.name, army.id] }]
    end
  end
end
