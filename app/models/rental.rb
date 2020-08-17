class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :start_end, :end_date, :rental_price, presence: true
  validates :content, :rating, uniqueness: true
  validates :user, uniqueness: { scope: :bike }
end
