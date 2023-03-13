class Job < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :employer_id
  has_many :users, through: :bids
end
