class Car
  $shirt_in_car = true

  def enter
    if !$has_prybar
      puts "The car door is locked."
      $outside.enter

    elsif $has_prybar && $shirt_in_car
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
          puts "You use the knife to cut the old shirt and make a bandage."
          puts "You are now healed."
          $injured = false
        end

        puts "1 Leave car"

        print "> "
        leave_car = $stdin.gets.chomp.downcase
        system "clear"

          if leave_car == "1" || leave_car.include?("leave")
            $outside.enter
          else
            self.enter
          end
        elsif action == "2" || action.include?("leave")
          $outside.enter
        end

    elsif $has_prybar && !$shirt_in_car
      puts "There's nothing inside the car."
      puts "1 Leave car"

      print "> "
      leave_action = $stdin.gets.chomp.downcase
      system "clear"

      if leave_action == "1" || leave_action.include?("shirt")
        $outside.enter
      else
        self.enter
      end
    end
  end
end
