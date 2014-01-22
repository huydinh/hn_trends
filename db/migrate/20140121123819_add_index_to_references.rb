class AddIndexToReferences < ActiveRecord::Migration
  def change
    add_index :references, [:word_id, :entry_id], unique: true
  end
end
