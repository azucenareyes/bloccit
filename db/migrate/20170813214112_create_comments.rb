class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end

# This is a class called CreateComments that inherits
# the migration method via ActiveRecord(like Sql database).
# The class is a table that holds two types of data:
# table text and table reference to the class Post.
# There is now a foreign_key attached to this table which
# Links the comment to the post
