class Bike < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :model, :type, :condition, :price, presence: true
  validates :condition, inclusion: { in: ["fair", "good", "new"], allow_nil: false }
  validates :type, inclusion: { in: ["electric", "flying", "monocycle", "tandem", "folding", "race", "city", "cargo"], allow_nil: false }
end
