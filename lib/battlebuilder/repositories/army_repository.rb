class ArmyRepository < Hanami::Repository
  associations do
    has_many :warscrolls
  end

  def all_by_grand_alliance_name(grand_alliance_name)
    armies
      .where(grand_alliance_name: grand_alliance_name)
      .as(:entity)
      .to_a
  end
end
