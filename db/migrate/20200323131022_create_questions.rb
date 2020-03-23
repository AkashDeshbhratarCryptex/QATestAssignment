class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :description
      t.references :user, foreign_key: true, index: true
      t.timestamps
    end
  end
end
