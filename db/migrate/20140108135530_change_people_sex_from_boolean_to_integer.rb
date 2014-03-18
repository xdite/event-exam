class ChangePeopleSexFromBooleanToInteger < ActiveRecord::Migration
  def change
  	change_column :people, :sex, :integer, :limit => 1
  end
end
