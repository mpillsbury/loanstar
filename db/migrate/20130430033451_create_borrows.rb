class CreateBorrows < ActiveRecord::Migration
  def self.up
    create_table :borrows do |t|
      t.date :request_date
      t.integer :item_id
      t.integer :user_id
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :borrows
  end
end
