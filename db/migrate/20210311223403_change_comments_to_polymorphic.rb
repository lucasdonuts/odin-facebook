class ChangeCommentsToPolymorphic < ActiveRecord::Migration[6.1]
  def change
    rename_column :comments, :post_id, :commentable_id
    add_column :comments, :commentable_type, :string
  end
end
