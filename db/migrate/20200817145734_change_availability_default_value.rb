class ChangeAvailabilityDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bikes, :availability, from: nil, to: true
  end
end
