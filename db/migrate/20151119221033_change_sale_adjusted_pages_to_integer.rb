class ChangeSaleAdjustedPagesToInteger < ActiveRecord::Migration
  def change
    change_column :sales, :adjusted_page_count, :integer
  end
end
