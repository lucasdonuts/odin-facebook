class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :status, default: 0
      t.references :user, null: false, index: true
      t.references :notifiable, polymorphic: true

      t.timestamps
    end
  end
end
