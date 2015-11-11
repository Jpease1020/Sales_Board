class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|

      t.timestamps null: false
      t.references :user, foriegn_key: true
    end
  end
end
