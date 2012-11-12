

class Player
  def initialize
    @last_turns_health = 0
  end

  def play_turn(warrior)
    if look(warrior)
    elsif warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.captive?
      warrior.rescue!  
    elsif warrior.feel.enemy?
      warrior.attack!

    elsif taking_damage?(warrior)
      if warrior.health < 12
        warrior.walk!(:backward)
      else
        warrior.walk!
      end
    elsif warrior.feel.empty? && warrior.health < 20
      warrior.rest!
    elsif
      go_backwards(warrior)
    else
      warrior.walk! 
    end
    @last_turns_health = warrior.health
  end

  def taking_damage?(warrior)
    warrior.health < @last_turns_health
  end

  def look(warrior)
    warrior.look.any? do |s| 
      if s.enemy? == true
        warrior.shoot!
      end
    end
  end

  def go_backwards(warrior)
    if @last_turns_health < 12
      warrior.walk!(:backward)
    end
  end
end
