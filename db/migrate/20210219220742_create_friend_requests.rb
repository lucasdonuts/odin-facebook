class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.integer :status
      t.references :recipient, null: false, foreign_key: { to_table: :users }, index: true
      t.references :requester, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
