class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :text, null:false
      t.belongs_to :user,foreign_key: true
      t.timestamps
    end
  end
end
