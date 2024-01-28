class CreateActiveStorageAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :active_storage_attachments do |t|

      t.timestamps
    end
  end
end
