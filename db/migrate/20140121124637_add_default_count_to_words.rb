class AddDefaultCountToWords < ActiveRecord::Migration
  def up
    change_column :words, :count, :integer, default: 1
  end

  def down
    change_column :words, :count, :integer, default: 0
  end
end
