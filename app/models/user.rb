class User < ApplicationRecord
  has_many :bikes, dependent: :destroy
  has_many :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :email, :address, :phone_number, presence: true
  has_one_attached :photo
end
