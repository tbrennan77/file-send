class CreateBwFiles < ActiveRecord::Migration
  def change
    create_table :bw_files do |t|
      t.references :user
      t.string :name
      t.string :permalink
      t.string :receiver_email
      t.timestamps
    end
  end
end
