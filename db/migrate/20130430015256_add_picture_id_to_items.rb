class AddPictureIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :picture_id, :integer
  end

  def self.down
    remove_column :items, :picture_id
  end
end
