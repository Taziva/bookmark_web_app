require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email,     String
  property :password,   BCryptHash
  property :password_confirmation, BCryptHash

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  class << self
    def count
      self.all.count
    end
  end



end
