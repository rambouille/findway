class ChangeColumnsToMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :author
    remove_column :messages, :client_id
    remove_column :messages, :coach_id
  end
end
