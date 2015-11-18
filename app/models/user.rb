class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  has_many :sales

  def salesperson?
    role == 1
  end

  def assistant?
    role == 2
  end

  def admin?
    role == 3
  end

  def assistant_name
    User.find_by(id: self.assistant_id).name
  end

end
