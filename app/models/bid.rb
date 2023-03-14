class Bid < ApplicationRecord
  belongs_to :freelancer, class_name: "User", foreign_key: :freelancer_id
  belongs_to :job

  validates :rate, presence: true
end
