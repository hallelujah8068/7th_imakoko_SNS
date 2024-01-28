class CreateActiveStorageAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :active_storage_attachments do |t|
      t.string :name, null: false
      t.string :record_type, null: false
      t.bigint :record_id, null: false
      t.bigint :blob_id, null: false

      t.timestamps
    end

    add_index :active_storage_attachments, :blob_id
    add_index :active_storage_attachments, [:record_type, :record_id, :name, :blob_id], name: "index_active_storage_attachments_uniqueness", unique: true
  end
end