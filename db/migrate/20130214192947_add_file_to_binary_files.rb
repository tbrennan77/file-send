class AddFileToBinaryFiles < ActiveRecord::Migration
  def self.up
    add_attachment :bw_attachments, :binary_file
  end

  def self.down
    remove_attachment :bw_attachments, :binary_file
  end
end
