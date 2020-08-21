class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  validates :start_date, :end_date, :rental_price, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5], allow_nil: false }
  # validates :user, uniqueness: { scope: :bike }
end
