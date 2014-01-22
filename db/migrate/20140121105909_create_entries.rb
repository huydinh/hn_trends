class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :hn_id
      t.string :href

      t.timestamps
    end
  end
end
