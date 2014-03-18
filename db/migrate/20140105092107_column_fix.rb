class ColumnFix < ActiveRecord::Migration
  def change
  	rename_column :people, :dafa_attitube, :dafa_attitude
  end
end
