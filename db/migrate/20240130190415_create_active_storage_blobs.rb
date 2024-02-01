class CreateActiveStorageBlobs < ActiveRecord::Migration[7.0]
  def change
    create_table :active_storage_blobs do |t|
      t.string :key, null: false
      t.string :filename, null: false
      t.string :content_type
      t.text :metadata
      t.string :service_name, null: false
      t.bigint :byte_size, null: false
      t.string :checksum

      t.index [:key], name: "index_active_storage_blobs_on_key", unique: true
    end
  end
end