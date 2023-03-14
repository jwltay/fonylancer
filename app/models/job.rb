class Job < ApplicationRecord
  belongs_to :employer, class_name: "User", foreign_key: :employer_id
  has_many :freelancers, through: :bids
  has_many :bids

  validates :title, presence: true
  validates :description, presence: true
  validates :budget, presence: true
  validates :start_date, presence: true, comparison: { greater_than: :end_date }
  validates :end_date, presence: true
end
