class AddRaccoonLimitToUser < ActiveRecord::Migration
  def change
    add_column :users, :raccoon_limit, :integer
  end
end
