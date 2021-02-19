class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }, index: true
      t.references :friend, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
