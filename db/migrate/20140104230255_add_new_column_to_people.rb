class AddNewColumnToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :shenyun_watch, :text
  	add_column :people, :interactive, :text
  	add_column :people, :level, :integer
  	add_column :people, :dafa_attitude, :integer
  end
end
