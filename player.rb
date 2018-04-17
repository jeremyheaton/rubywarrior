class Player
  MIN_HEALTH = 8

  def play_turn(warrior)
    puts @minimum
    if warrior.feel.enemy?
      warrior.attack!
    elsif warrior.health < MIN_HEALTH
      warrior.rest!
    else
      warrior.walk!
    end
  end
end
