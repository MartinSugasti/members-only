class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
