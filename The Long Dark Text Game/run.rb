class Run
  require "./locations/outside.rb"
  require "./locations/cabin.rb"
  require "./locations/shed.rb"
  require "./locations/car.rb"

  def initialize
    $outside = Outside.new
    $cabin = Cabin.new
    $shed = Shed.new
    $car = Car.new

    $hungry = true
    $injured = false
    $has_knife = false
    $has_shirt = false
    $has_prybar = false
  end

  def start
    $start_time = Time.now
    puts "You have lost your way in the woods."
    puts "You are hungry and tired."
    puts "You see a cabin."
    $outside.enter
  end
end

new_game = Run.new
new_game.start
