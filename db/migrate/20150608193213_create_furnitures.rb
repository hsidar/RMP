class CreateFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :style
      t.string :type
      t.references :raccoon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
