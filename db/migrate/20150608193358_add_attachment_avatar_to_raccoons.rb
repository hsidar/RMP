class AddAttachmentAvatarToRaccoons < ActiveRecord::Migration
  def self.up
    change_table :raccoons do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :raccoons, :avatar
  end
end
