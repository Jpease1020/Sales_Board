class AddSingleSaleToSale < ActiveRecord::Migration
  def change
    add_column :sales, :single_sale, :decimal
  end
end
