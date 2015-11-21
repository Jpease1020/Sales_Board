class CreateSalesPresenters < ActiveRecord::Migration
  def change
    create_table :sales_presenters do |t|

      t.timestamps null: false
    end
  end
end
