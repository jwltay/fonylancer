class Job < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :employer_id
  has_many :users, through: :bids
  has_many :bids

  validates :title, presence: true
  validates :description, presence: true
  validates :budget, presence: true
  validates :start_date, presence: true, comparison: { greater_than: :end_date }
  validates :end_date, presence: true
end
