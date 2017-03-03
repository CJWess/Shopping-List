class User < ActiveRecord::Base

  has_many :meals
  has_many :list_items, through: :meals
  has_many :lists

  validates_uniqueness_of :email

  def password
    BCrypt::Password.new(self.hash_pass)
  end

  def password=(pass)
    self.hash_pass = BCrypt::Password.create(pass)
  end

  def self.authenticate(args)
    if instance = self.find_by(email: args[:email])
      if instance.password == args[:password]
        instance
      else
        nil
      end
    else
      nil
    end
  end

end
