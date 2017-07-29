class Warscroll < Hanami::Entity
  def to_json
    army_hash = army.to_h

    to_h
      .merge(army: army_hash)
      .to_json
  end
end
