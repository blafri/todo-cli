require_relative '../lib/todo_cli/user'

RSpec.describe TodoCli::User do
  context 'attributes' do
    it 'should respond to user_name' do
      user = TodoCli::User.new('username', 'password')
      expect(user).to respond_to(:user_name)
    end

    it 'should respond to password' do
      user = TodoCli::User.new('username', 'password')
      expect(user).to respond_to(:password)
    end
  end

  context '::valid_credentials?' do
    it 'should return true for valid credentials' do
      expect(TodoCli::User.valid_credentials?('test', 'C00lness'))
        .to eq(true)
    end

    it 'should return false for invalid credentials' do
      expect(TodoCli::User.valid_credentials?('test', 'C00lness_bad'))
        .to eq(false)
    end
  end
end
