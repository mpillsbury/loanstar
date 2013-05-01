class RemoveEndDateAndStatusFromBorrows < ActiveRecord::Migration
  def self.up
    remove_column :borrows, :end_date
    remove_column :borrows, :status
  end

  def self.down
    add_column :borrows, :status, :string
    add_column :borrows, :end_date, :date
  end
end
