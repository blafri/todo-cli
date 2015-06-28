require_relative '../lib/todo_cli/request'

RSpec.describe TodoCli::Request do
  context 'attributes' do
    it 'should respond to req_type' do
      req = TodoCli::Request.new('test', 'user', 'password')
      expect(req).to respond_to(:req_type)
    end

    it 'should respond to uri' do
      req = TodoCli::Request.new('test', 'user', 'password')
      expect(req).to respond_to(:uri)
    end

    it 'should respond to uri' do
      req = TodoCli::Request.new('test', 'user', 'password')
      expect(req).to respond_to(:user_name)
    end

    it 'should respond to uri' do
      req = TodoCli::Request.new('test', 'user', 'password')
      expect(req).to respond_to(:password)
    end
  end

  context '#execute' do
    it 'executes a get request' do
      req = TodoCli::Request.new('api/lists', 'test', 'C00lness')
      expect(req.execute).to eq('200')
    end
  end
end
