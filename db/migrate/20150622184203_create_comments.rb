class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, index: true
      t.references :post, index: true
      t.string :picture

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :posts
    add_index :comments, [:post_id, :created_at]
  end
end
