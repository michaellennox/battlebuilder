module Admin::Views::Warscrolls
  class Update
    include Admin::View
    template 'armies/edit'

    def army_names
      Hash[armies.map { |army| [army.name, army.id] }]
    end
  end
end
