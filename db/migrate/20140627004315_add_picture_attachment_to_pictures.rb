class AddPictureAttachmentToPictures < ActiveRecord::Migration
  def change
    add_attachment :pictures, :picture
  end
end
