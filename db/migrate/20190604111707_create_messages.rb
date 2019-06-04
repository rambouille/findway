class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :client
      t.references :coach
      t.text :content
      t.boolean :from_coach
      t.string :attachment_path

      t.timestamps
    end
  end
end
