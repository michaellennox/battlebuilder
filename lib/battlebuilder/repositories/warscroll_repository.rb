class WarscrollRepository < Hanami::Repository
  associations do
    belongs_to :army
  end

  def all_with_army
    aggregate(:army)
      .map_to(Warscroll)
      .to_a
  end

  def all_with_army_by_army_id(army_id)
    aggregate(:army)
      .where(army_id: army_id)
      .map_to(Warscroll)
      .to_a
  end
end
