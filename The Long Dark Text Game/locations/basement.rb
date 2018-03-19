class Basement

  def initialize
    @safe_locked = true
    @safe_code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    @guess_count = 0
  end

  def enter
    puts "You're in the basement."
    puts "You find a safe."
    puts "1 Crack the safe"
    puts "2 Leave basement"

    print "> "
    action = $stdin.gets.chomp.downcase
    system "clear"

    if action == "1" || action.include?("safe")
      crack_safe

    elsif action == "2" || action.include?("leave")
      $cabin.enter

    else
      self.enter
    end
  end

  def crack_safe
    #safe is locked and has guesses left
    if @safe_locked && @guess_count < 10
      puts "You have #{10 - @guess_count} guesses left."
      puts "Enter a three digit number."

      print "> "
      guess = $stdin.gets.chomp
      system "clear"

      if guess.to_i.to_s != guess || guess.length != 3
        crack_safe
      end

      @guess_count += 1

      if guess == @safe_code
        @safe_locked = false
        puts "You find a journal in the safe."
        puts "1 Read Journal"
        puts "2 Leave basement"

        print "> "
        action = $stdin.gets.chomp.downcase
        system "clear"

        if action == "1" || action.include?("journal")
          puts $journal
          puts "1 Leave basement"

          print "> "
          journal_action = $stdin.gets.chomp.downcase
          system "clear"

          if journal_action == "1" || journal_action.include?("leave")
            $cabin.enter
          end

        elsif action == "2" || action.include?("leave")
          $cabin.enter

        else
          crack_safe
        end

      else
        crack_safe
      end
    #safe is locked and has no guesses left
  elsif @safe_locked && @guess_count >= 10
      puts "You ran out of guesses."
      puts "The safe is locked forever."
      self.enter
    #safe is not locked
    else
      puts "You find a journal in the safe."
      puts "1 Read Journal"
      puts "2 Leave basement"

      print "> "
      action = $stdin.gets.chomp.downcase
      system "clear"

      if action == "1" || action.include?("journal")
        puts $journal
        puts "1 Leave basement"

        print "> "
        journal_action = $stdin.gets.chomp.downcase
        system "clear"

        if journal_action == "1" || journal_action.include?("leave")
          $cabin.enter
        end

      elsif action == "2" || action.include?("leave")
        $cabin.enter

      else
        crack_safe
      end
    end
  end
end
