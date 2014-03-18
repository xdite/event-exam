class AddSexToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :sex ,:boolean, :default => 1
  end
end
