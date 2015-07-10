class AddUserToRaccoon < ActiveRecord::Migration
  def change
    add_reference :raccoons, :user, index: true, foreign_key: true
  end
end
