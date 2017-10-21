class CreateSposts < ActiveRecord::Migration[5.1]
  def change
    create_table :sposts do |t|
      t.string :title
      t.text :body
      t.integer :price
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
