require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email,     String
  property :password_digest,   BCryptHash

  attr_accessor :password_confirmation
  
  validates_confirmation_of :password_digest, confirm: :password_confirmation

  class << self
    def count
      self.all.count
    end
  end

end
