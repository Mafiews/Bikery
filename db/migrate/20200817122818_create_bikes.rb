class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :model
      t.string :type
      t.string :condition
      t.boolean :availability, default: true
      t.integer :price
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
