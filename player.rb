class Player
  MIN_HEALTH = 15

  def play_turn(warrior)
    puts @health
    if warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.health < MIN_HEALTH && unharmed?(warrior)
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end

  def unharmed?(warrior)
    warrior.health >= @health
  end
end
