class RemovePictureIdFromItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :picture_id
  end

  def self.down
    add_column :items, :picture_id, :integer
  end
end
