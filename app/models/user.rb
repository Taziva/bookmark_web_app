require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource
  property :id, Serial
  property :email,     String
  property :password,   String

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
