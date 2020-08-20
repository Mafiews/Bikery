class Rental < ApplicationRecord

  belongs_to :user
  belongs_to :bike
  validates :start_date, :end_date, :rental_price, presence: true
  # validates :user, uniqueness: { scope: :bike }
end
