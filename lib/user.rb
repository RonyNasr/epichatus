require 'bcrypt'
class User < ActiveRecord::Base
  validates(:username, :presence => true)
  validates(:email, :presence => true)
  validates(:password, :presence => true)
  has_many(:conversations, :foreign_key => :sender_id)
  include BCrypt

  def self.authenticate(params = {})
    email = params[:email]
    password = params[:password]
    found_user = nil
    if !(User.find_by email: email)
      found_user
    else
      user = User.find_by email: email
      password_hash = Password.new(user.password)
      if password_hash == password
        found_user = user
      end
      found_user
    end
  end
end
