class Outside
  def enter
    puts "1 Enter cabin"
    puts "2 Enter shed"
    puts "3 Enter broken-down car"

    print "> "
    direction = $stdin.gets.chomp.downcase
    system "clear"

    if direction == "1" || direction.include?("cabin")
      $cabin.enter
    elsif direction == "2" || direction.include?("shed")
      $shed.enter
    elsif direction == "3" || direction.include?("car")
      $car.enter
    else
      self.enter
    end
  end
end
