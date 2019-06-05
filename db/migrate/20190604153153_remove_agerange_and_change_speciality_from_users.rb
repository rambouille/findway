class RemoveAgerangeAndChangeSpecialityFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :age_range
    rename_column :users, :study_scope, :speciality
    rename_column :users, :sype_username, :skype_username
  end
end
