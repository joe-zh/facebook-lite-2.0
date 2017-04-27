class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :text
      t.integer :user_id
      t.references :user

      t.timestamps null: false
    end
  end
end
