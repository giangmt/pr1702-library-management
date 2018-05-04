class ChangeDataTypeForDescriptionToAuthors < ActiveRecord::Migration[5.1]
  def change
    change_column :authors, :description, :text
  end
end
