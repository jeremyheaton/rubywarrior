class Player
  @rescued = false

  def play_turn(warrior)
    if @health.nil?
      @health = 20
    end

    if warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
      @rescued = true
    elsif warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif !warrior.look[1].captive? && can_shoot?(warrior) && !attacked?(warrior)
      warrior.shoot!
    elsif heal?(warrior)
      if !attacked?(warrior)
        warrior.rest!
      else
        warrior.walk!(:backward)
      end
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

  def can_shoot?(warrior)
    index = warrior.look.index { |vision| vision.enemy? }
    if index.nil?
      false
    else
      true
    end
  end
end
