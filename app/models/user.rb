class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false }
  validates :password,
    presence: true,
    length: { minimum: 10 }
  validates :password_confirmation, presence: true

  before_save :clean_email

  def clean_email
    self.email.strip.downcase
  end

  def self.authenticate_with_credentials(email, password)
    clean_email = email.strip.downcase

    user = User.find_by_email(clean_email)

    if user && user.authenticate(password)
      return user
    end

    nil
  end
end
