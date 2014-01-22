class AddIndexToEntries < ActiveRecord::Migration
  def change
    add_index :entries, :hn_id, unique: true
  end
end
