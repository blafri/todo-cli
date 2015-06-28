require_relative '../lib/todo_cli/menu'
require_relative '../lib/todo_cli/user'

system 'clear'

menu = nil
puts 'Welcome to Open TODO CLI'

while menu.nil?
  puts 'Please enter your user name'
  user_name = gets.chomp

  puts 'Please enter your password'
  password = gets.chomp

  if TodoCli::User.valid_credentials?(user_name, password)
    menu = TodoCli::Menu.new(user_name, password)
  else
    puts 'Login Unsuccessful'
    puts ''
  end
end

menu.print_menu until menu.exit?
