class Player
  def initialize
    @last_turns_health = 0
  end

  def play_turn(warrior)
    look(warrior)
      # if warrior.look.empty? == false
      #   look(warrior)
      # else
      #   break
      # end
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel.captive?
      warrior.rescue!
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
    warrior.look.each do |word|
      if word == "Wizard"
        warrior.shoot!
      else
        break
      end
    end
  end

  def go_backwards(warrior)
    if @last_turns_health < 12
      warrior.walk!(:backward)
    end
  end
end
