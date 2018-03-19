class Cabin
  require "./locations/basement.rb"

  def initialize
    @basement = Basement.new
    @knife_in_kitchen = true
$journal = <<END
3/17/18...I honestly can't believe you cracked the code.
3/12/18...If I can't play TLD, I'll make TLD.
I think adding a bleedout timer would make things interesting.
END
  end

  def enter
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
      if @knife_in_kitchen
        puts "You find a knife and take it."
        $has_knife = true
        @knife_in_kitchen = false

        if $injured && $has_shirt
          puts "You use the knife to cut the old shirt and make a bandage."
          puts "You are now healed."
          $injured = false
        end

        self.enter
      else
        puts "There's nothing inside the kitchen."
        self.enter
      end
    #basement
    elsif action == "2" || action.include?("basement")
      @basement.enter
    #bed
    elsif action == "3" || action.include?("bed")
      if $hungry
        puts "You're too hungry to sleep."
        self.enter
      elsif $injured
        puts "You're too injured to sleep."
        self.enter
      else
        end_time = Time.now
        player_time = end_time - $start_time
        puts "You survived the night."
        puts "You beat the game in #{player_time.to_i} seconds"
        exit(0)
      end

    elsif action == "4" || action.include?("leave")
      $outside.enter

    else
      self.enter
    end
  end
end
