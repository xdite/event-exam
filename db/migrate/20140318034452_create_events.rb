class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.string :person_limit
      t.string :active_date
      t.string :price
      t.string :user_id

      t.timestamps
    end
  end
end
