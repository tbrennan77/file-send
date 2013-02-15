class CreateBinaryFiles < ActiveRecord::Migration
  def change
    create_table :bw_attachments do |t|
      t.references :bw_file
      t.string :permalink
      t.timestamps
    end
  end
end
