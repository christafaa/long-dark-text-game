class Shed

  def initialize
    @wolf_in_shed = true
    @beans_in_shed = true
    @prybar_in_shed = true
  end

  def enter
    if @wolf_in_shed
      puts "A starving wolf jumps out of the shed,"
      puts "bites your arm, and runs away."
      puts "You are now injured."
      @wolf_in_shed = false
      $injured = true
      self.enter
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
        if @prybar_in_shed
          puts "You find a prybar and take it."
          $has_prybar = true
          @prybar_in_shed = false
          $car_locked = false
          self.enter
        else
          puts "There's nothing in the toolbox."
          self.enter
        end
    #shelf
      elsif action == "2" || action.include?("shelf")
        if @beans_in_shed
          puts "You find a can of beans and eat it."
          puts "You are no longer hungry."
          $hungry = false
          @beans_in_shed = false
        self.enter
        else
          puts "There's nothing on the shelf."
          self.enter
        end

      elsif action == "3" || action.include?("leave")
        $outside.enter

      else
        self.enter
      end
    end
  end
end
