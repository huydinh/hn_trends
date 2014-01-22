class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :word_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
