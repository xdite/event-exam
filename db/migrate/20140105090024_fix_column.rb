class FixColumn < ActiveRecord::Migration
  def change
  	remove_column :people, :level
  	remove_column :people, :dafa_attitude
  	add_column :people, :level, :integer, :default => 0
  	add_column :people, :dafa_attitube, :integer, :default => 0
  end
end
