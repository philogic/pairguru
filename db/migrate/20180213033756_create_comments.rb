class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :movie, foreign_key: true, index: true, unique: true
      t.references :user, foreign_key: true, index: true, unique: true

      t.timestamps
    end
  end
end
