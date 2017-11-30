require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :mobile_number, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


end
