class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true
  validates :password_digest, presence: true
  validates :password_digest, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true

  def self.authenticate_with_credentials(email,password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
