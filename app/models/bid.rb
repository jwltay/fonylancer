class Bid < ApplicationRecord
  belongs_to :freelancer
  belongs_to :job

  validates :rate, presence: true
end
