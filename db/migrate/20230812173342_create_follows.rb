class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :following_id, null: false, foreign_key: { to_table: :users }
      t.references :follower_id, null: false, foreign_key: { to_table: :users }
      t.datetime :discarded_at

      t.timestamps
    end
  end
end