require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email,     String
  property :password_digest,   Text

  class << self

    def count
      self.all.count
    end
  end


end
