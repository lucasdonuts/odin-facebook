class AddIndexToLikes < ActiveRecord::Migration[6.1]
  def change
    add_index :likes, [:likeable_id, :likeable_type]
  end
end
