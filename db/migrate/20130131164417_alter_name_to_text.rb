class AlterNameToText < ActiveRecord::Migration
  def change
    execute "ALTER TABLE bw_files DROP COLUMN name; ALTER TABLE bw_files ADD COLUMN name text;"
  end
end
