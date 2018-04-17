class Player
  @rescued = false

  def play_turn(warrior)
    if warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
      @rescued = true
    elsif warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif heal?(warrior)
      if !attacked?(warrior)
        warrior.rest!
      else
        warrior.walk!(:backward)
      end
    elsif warrior.look[1].enemy?
      warrior.shoot!
    else
      warrior.walk!
    end
    @health = warrior.health
  end

  def heal?(warrior)
    healing?(warrior) || warrior.health < 8
  end

  def healing?(warrior)
    warrior.health < 20 && warrior.health > @health
  end

  def attacked?(warrior)
     @health > warrior.health
  end
end
