class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date
      t.integer :rental_price
      t.text :content
      t.integer :rating
      t.references :users, null: false, foreign_key: true
      t.references :bikes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
