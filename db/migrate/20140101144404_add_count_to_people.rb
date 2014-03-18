class AddCountToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :people_count, :integer, :default => 0
  end
end
