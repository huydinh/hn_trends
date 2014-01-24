class RenameTableReferencesToWordReferences < ActiveRecord::Migration
  def up
    rename_table :references, :word_references
  end

  def down
    rename_table :word_references, :references
  end
end
