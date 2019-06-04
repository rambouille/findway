class ChangeFromCoachToAuthorForMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :from_coach
    add_column :messages, :author, :integer, default: 0
  end
end
