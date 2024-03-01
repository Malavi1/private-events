class RemoveUserIdFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :user_id, :integer
  end
end
