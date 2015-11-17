class AddAssistantIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :assistant_id, :integer, null: true
  end
end
