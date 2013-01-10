class Person < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates :email, presence: true, uniqueness: true

  before_create { generate_token(:auth_token) }

  before_save do
    self.email = email.downcase
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Person.exists?(column => self[column])
  end

end
