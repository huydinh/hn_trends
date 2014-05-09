class CreateHottestWords < ActiveRecord::Migration
  def change
    create_table :hottest_words do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
