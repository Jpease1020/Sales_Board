class Sale < ActiveRecord::Base # ~> NameError: uninitialized constant ActiveRecord
  belongs_to :user
  validates :user_id, :pages, :quantity, :job_title, :job_type, :customer,
            :mark_up, :frequency, :single_sale, presence: true
end
