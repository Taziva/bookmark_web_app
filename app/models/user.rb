require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email,     String
  property :password,   BCryptHash

  class << self
    def increment
      @count ||=0
      @count += 1
    end

    def count
      @count ||= 0
    end
  end



end
