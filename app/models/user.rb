require 'open-uri'

class User < ApplicationRecord
  has_many :bids
  has_many :jobs, through: :bids
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  attribute :want_to_work, default: true

  def country_code
    location.split(", ")[2]
  end

  def country
    @country_code = location.split(", ")[2]
    JSON.parse(URI.open("https://restcountries.com/v3.1/alpha/#{@country_code}").read)[0]["name"]["common"]
  end

  def open_projects
    sql = "bids.freelancer_id = #{id} AND bids.accepted = true AND jobs.complete = false"
    Bid.joins(:job).where(sql)
  end
end
