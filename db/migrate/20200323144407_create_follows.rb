class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :user
      t.integer :following_id
      t.string :following_type
      t.timestamps
    end
  end
end
