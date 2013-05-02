class AddEndDateToBorrows < ActiveRecord::Migration
  def self.up
    add_column :borrows, :end_date, :date
  end

  def self.down
    remove_column :borrows, :end_date
  end
end
