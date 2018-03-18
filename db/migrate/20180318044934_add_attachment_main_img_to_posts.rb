class AddAttachmentMainImgToPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :posts do |t|
      t.attachment :main_img
    end
  end

  def self.down
    remove_attachment :posts, :main_img
  end
end
