class User < ApplicationRecord
  has_many :bids
  has_many :jobs, through: :bids
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  attribute :want_to_work, default: true
end
