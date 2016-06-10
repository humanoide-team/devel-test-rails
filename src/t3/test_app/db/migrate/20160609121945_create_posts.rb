class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.string :description
      t.string :author
      t.text :body
      t.date :insert_date
      t.date :update_date

      t.timestamps null: false
    end
  end
end
