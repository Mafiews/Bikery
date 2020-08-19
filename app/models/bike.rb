class Bike < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo
  validates :model, :bike_type, :condition, :price, presence: true
  validates :price, numericality: { :greater_than_or_equal_to => 0 }
  validates :condition, inclusion: { in: ["fair", "good", "new"], allow_nil: false }
  validates :bike_type, inclusion: { in: ["electric", "flying", "monocycle", "tandem", "folding", "race", "city", "cargo"], allow_nil: false }
end
