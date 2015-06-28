require_relative 'user'

module TodoCli
  # Public: The menu controller it handles all the commands entered at the
  #         prompt
  class Menu
    attr_reader :current_user

    def initialize(user_name, password)
      @exit = false
      @current_user = TodoCli::User.new(user_name, password)
    end

    def commands
      {
        exit: -> { exit_app }
      }
    end

    def print_menu
      puts 'Please enter a command'
      command = gets.chomp.to_sym

      if commands.include?(command)
        puts commands.fetch(command).call
      else
        puts 'Not a valid command'
        puts ''
      end
    end

    def exit?
      @exit
    end

    private

    def exit_app
      @exit = true
      puts ''
      puts 'Bye!!!'
    end
  end
end
