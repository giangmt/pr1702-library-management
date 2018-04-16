class ChangeDataTypeForStatusToBorrows < ActiveRecord::Migration[5.1]
  def change
    change_column :borrows, :status, :integer, default: 0
  end
end
