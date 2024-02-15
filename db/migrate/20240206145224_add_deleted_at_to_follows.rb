class AddDeletedAtToFollows < ActiveRecord::Migration[7.0]
  def change
    add_column :follows, :deleted_at, :datetime
    add_index :follows, :deleted_at
  end
end
