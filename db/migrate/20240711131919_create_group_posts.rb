class CreateGroupPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :group_posts do |t|
      t.references :post, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
