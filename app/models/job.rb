class Job < ApplicationRecord
  belongs_to :employer, class_name: "User", foreign_key: :employer_id
  has_many :freelancers, through: :bids
  has_many :bids

  validates :title, presence: true
  validates :description, presence: true
  validates :budget, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :start_date, presence: true

  def open?
    bids.each do |bid|
      return false if bid.accepted == true
    end
    return true
  end
end
