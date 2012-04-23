require 'bcrypt'

class LoginSession < ActiveRecord::Base
  EXPIRY = 60 * 60 # 1 hour

  def generate_code
    code = SecureRandom.hex(32).to_s
    self.hashed_code = BCrypt::Password.create(code)
    code
  end

  def self.lookup_code(id, code)
    login_session = self.find(id)
    BCrypt::Password.new(login_session.hashed_code) == code ? login_session : nil
  end

  def expired?
    DateTime.current.to_i - self.created_at.to_i > EXPIRY
  end  
end
