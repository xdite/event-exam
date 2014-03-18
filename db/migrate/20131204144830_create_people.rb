class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :mobeil
      t.string :zip_code
      t.string :address
      t.string :telephone
      t.string :fax
      t.string :email
      t.string :company_name
      t.string :company_department
      t.string :company_title
      t.string :company_unified_numbering
      t.string :company_zip_code
      t.string :company_address
      t.string :company_telephone_1
      t.string :company_telephone_2
      t.string :company_fax
      t.string :company_email
      t.string :company_website
      t.string :ps

      t.timestamps
    end
  end
end
