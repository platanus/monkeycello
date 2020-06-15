class CasinoObserver < PowerTypes::Observer
  after_save :starting_casino

  def starting_casino
    CreateStartingPlayers.for(casino: object)
  end
end
