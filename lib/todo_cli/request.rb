require 'net/http'

module TodoCli
  # Public: This class handles all requests to the TODO API server
  #
  # Examples
  #
  #   TodoCli::Request.new('api/lists', 'user', 'password').execute
  #   => '200' #status code obtained from request
  class Request
    attr_reader :req_type, :uri, :user_name, :password, :response

    BASEURI = 'https://blafri868-open-todo-api.herokuapp.com'

    # Public: Sets up the request class
    #
    # type - The type of request get, post, put etc
    # endpoint - The endpoint to make the conection to
    # user_name - user name for user
    # password - password for user
    def initialize(type = 'get', endpoint, user_name, password)
      @req_type = type
      @uri = URI("#{BASEURI}/#{endpoint}")
      @user_name = user_name
      @password = password
    end

    # Public: Sets up the request sends it to the server
    #
    # Returns a String indicating the response code from the server
    def execute
      action = {
        get: proc { setup_get_request }
      }

      req = action[req_type.to_sym].call
      req.basic_auth user_name, password
      send_request(req)
    end

    # Public: Makes the http request to the server
    #
    # Returns a String indicating the response code from the server
    def send_request(request)
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        @response = (http.request request)
      end

      response.code
    end

    private

    def setup_get_request
      Net::HTTP::Get.new uri
    end
  end
end
