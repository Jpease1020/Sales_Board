class ChangeAssistantIdInUsersToDefaultToZero < ActiveRecord::Migration
  def change
    change_column :users, :assistant_id, :integer, default: 0
  end
end
