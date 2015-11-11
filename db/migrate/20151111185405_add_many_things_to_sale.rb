class AddManyThingsToSale < ActiveRecord::Migration
  def change
    add_column :sales, :pages, :integer
    add_column :sales, :quantity, :integer
    add_column :sales, :job_title, :string
    add_column :sales, :job_type, :string
    add_column :sales, :amount, :decimal
    add_column :sales, :customer, :integer
    add_column :sales, :mark_up, :float
    add_column :sales, :frequency, :integer
  end
end
