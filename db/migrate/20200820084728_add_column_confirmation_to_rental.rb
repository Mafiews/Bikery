class AddColumnConfirmationToRental < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :confirmation, :boolean
  end
end
