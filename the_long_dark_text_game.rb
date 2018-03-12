#The Long Dark Text Based Game

#character
$hungry = true
$injured = false
$has_knife = false
$has_shirt = false
$has_prybar = false
$has_bandage = false

#setting
$car_locked = true
$knife_in_kitchen = true
$shirt_in_car = true
$wolf_in_shed = true
$beans_in_shed = true
$prybar_in_shed = true
$knife_in_kitchen = true

$journal = <<END
3/12/18...If I can't play TLD, I'll make TLD.
I think adding a bleedout timer would make things interesting.
END

def start
  $start_time = Time.now
  puts "You have lost your way in the woods."
  puts "You are hungry and tired."
  puts "You see a cabin."
  outside
end

def outside
  puts "1 Enter cabin"
  puts "2 Enter shed"
  puts "3 Enter broken down car"

  print "> "
  direction = $stdin.gets.chomp.downcase
  system "clear"

  if direction == "1" || direction.include?("cabin")
    enter_cabin
  elsif direction == "2" || direction.include?("shed")
    enter_shed
  elsif direction == "3" || direction.include?("car")
    enter_car
  else
    outside
  end
end

def enter_cabin
  puts "You're in the cabin:"
  puts "1 Check kitchen"
  puts "2 Check basement"
  puts "3 You see a bed. Get some rest."
  puts "4 Leave cabin"

  print "> "
  action = $stdin.gets.chomp.downcase
  system "clear"
#kitchen
  if action == "1" || action.include?("kitchen")
    if $knife_in_kitchen
      puts "You find a knife and take it."
      $has_knife = true
      $knife_in_kitchen = false

      if $injured && $has_shirt
        puts "You use the knife to cut the old shirt to make a bandage."
        puts "You are now healed."
        $injured = false
      end

      enter_cabin
    else
      puts "There's nothing inside the kitchen."
      enter_cabin
    end
#basement
  elsif action == "2" || action.include?("basement")
    enter_basement
#bed
  elsif action == "3" || action.include?("bed")
    if $hungry
      puts "You're too hungry to sleep."
      enter_cabin
    elsif $injured
      puts "You're too injured to sleep."
      enter_cabin
    else
      end_time = Time.now
      player_time = end_time - $start_time
      puts "You survived the night."
      puts "You beat the game in #{player_time.to_i} seconds"
      exit(0)
    end

  elsif action == "4" || action.include?("leave")
    outside

  else
    enter_cabin
  end
end

def enter_shed
  if $wolf_in_shed
    puts "A starving wolf jumps out of the shed, bites your arm, and runs away."
    puts "You are now injured."
    $wolf_in_shed = false
    $injured = true
    enter_shed
  else
    puts "You're in the shed:"
    puts "1 Check toolbox"
    puts "2 Check shelf"
    puts "3 Leave shed"

    print "> "
    action = $stdin.gets.chomp.downcase
    system "clear"
#toolbox
    if action == "1" || action.include?("toolbox")
      if $prybar_in_shed
        puts "You find a prybar and take it."
        $has_prybar = true
        $prybar_in_shed = false
        $car_locked = false
        enter_shed
      else
        puts "There's nothing in the toolbox."
        enter_shed
      end
#shelf
    elsif action == "2" || action.include?("shelf")
      if $beans_in_shed
        puts "You find a can of beans and eat it."
        puts "You are no longer hungry."
        $hungry = false
        $beans_in_shed = false
      enter_shed
      else
        puts "There's nothing on the shelf."
        enter_shed
      end

    elsif action == "3" || action.include?("leave")
      outside

    else
      enter_shed
    end
  end
end

def enter_car
  if $car_locked
    puts "The car door is locked."
    outside

  elsif !$car_locked && $shirt_in_car
    puts "You're in the car:"
    puts "There's an old shirt on the passenger's seat."
    puts "1 Take old shirt"
    puts "2 Leave car"

    print "> "
    action = $stdin.gets.chomp.downcase
    system "clear"

    if action == "1" || action.include?("shirt")
      puts "You took the old shirt."
      $has_shirt = true
      $shirt_in_car = false

      if $injured && $has_knife
        puts "You use the knife to cut the old shirt to make a bandage."
        puts "You are now healed."
        $injured = false
      end

      puts "1 Leave car"

      print "> "
      leave_car = $stdin.gets.chomp.downcase
      system "clear"

        if leave_car == "1" || leave_car.include?("leave")
          outside
        else
          enter_car
        end
      elsif action == "2" || action.include?("leave")
        outside
      end

  elsif !$car_locked && !$shirt_in_car
    puts "There's nothing inside the car."
    puts "1 Leave car"

    print "> "
    leave_action = $stdin.gets.chomp.downcase
    system "clear"

    if leave_action == "1" || leave_action.include?("shirt")
      outside
    else
      enter_car
    end
  end
end

def enter_basement
  puts "You're in the basement."
  puts "You find a journal."
  puts "1 Read journal"
  puts "2 Leave basement"

  print "> "
  action = $stdin.gets.chomp.downcase
  system "clear"

  if action == "1" || action.include?("read")
    puts $journal
    puts "1 Leave basement"

    print "> "
    basement_action = $stdin.gets.chomp.downcase
    system "clear"

    if basement_action == "1" || basement_action.include?(leave)
      enter_cabin
    else
      enter_basement
    end

  elsif action == "2" || action.include?("leave")
    enter_cabin

  else
    enter_basement
  end
end

start
