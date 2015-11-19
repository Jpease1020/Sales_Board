class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true
  validates :assistant_id, presence: true
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
