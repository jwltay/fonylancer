class Bid < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: :freelancer_id
  belongs_to :job
end
