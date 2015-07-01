class CreateRaccoons < ActiveRecord::Migration
  def change
    create_table :raccoons do |t|
      t.string :name
      t.integer :claw_ferocity
      t.string :disposition

      t.timestamps null: false
    end
  end
end
