class Sale < ActiveRecord::Base # ~> NameError: uninitialized constant ActiveRecord
  belongs_to :user
  validates :user_id, :pages, :quantity, :job_title, :job_type, :customer,
            :mark_up, :frequency, :single_sale, presence: true
  before_save :enter_adjusted_pages

  def enter_adjusted_pages
    adjusted_page_count = calculated_page_count
  end

  def calculated_page_count
    area = length * width
    if area < 60
      pages / 2
    elsif area > 100
      pages * 2
    else
      pages
    end
  end
end
