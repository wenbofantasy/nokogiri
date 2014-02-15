class AddAttachmentAvatarToComputers < ActiveRecord::Migration
  def self.up
    change_table :computers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :computers, :avatar
  end
end
