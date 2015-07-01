class RenameTypeToKind < ActiveRecord::Migration
  def change
    rename_column :furnitures, :type, :kind
  end
end
