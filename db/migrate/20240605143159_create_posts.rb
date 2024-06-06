class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts, id: false do |t|
      t.integer :id
      t.string :title
      t.integer :image
      t.text :comment
      t.string :tag
      t.integer :user_id

      t.timestamps
    end
  end
end
