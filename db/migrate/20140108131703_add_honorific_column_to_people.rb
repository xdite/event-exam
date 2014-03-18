class AddHonorificColumnToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :honorific, :string
  end
end
