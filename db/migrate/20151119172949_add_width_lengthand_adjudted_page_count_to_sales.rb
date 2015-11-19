class AddWidthLengthandAdjudtedPageCountToSales < ActiveRecord::Migration
  def change
      add_column :sales, :width, :decimal
      add_column :sales, :length, :decimal
      add_column :sales, :adjusted_page_count, :decimal
  end
end
