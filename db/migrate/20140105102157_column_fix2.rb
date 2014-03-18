class ColumnFix2 < ActiveRecord::Migration
  def change
  	remove_column :people, :level
  	add_column :people, :level, :integer, :default => 1
  end
end
