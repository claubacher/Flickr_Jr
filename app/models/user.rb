class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true

  has_many :albums

  include BCrypt

  def self.authenticate(username, password_input)
    user = self.find_by_username(username)
    if user && user.password == password_input
      user
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
