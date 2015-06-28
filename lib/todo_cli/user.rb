require_relative 'request'

module TodoCli
  # Public: Sets up objects for users
  class User
    attr_reader :user_name, :password

    def initialize(user_name, password)
      @user_name = user_name
      @password = password
    end

    # Public: Checks if the credentials supplied are valid for a regisered user
    #
    # Returns a Boolean value indicating weather the supplied credetials are
    #         valid
    def self.valid_credentials?(user_name, password)
      res_code = TodoCli::Request.new('api/lists', user_name, password).execute

      if res_code == '200'
        true
      else
        false
      end
    end
  end
end
