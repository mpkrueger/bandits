class Goal < ApplicationRecord
  belongs_to :family
  has_many :to_dos
  has_many :comments
  has_many :colleges
  has_many :houses
  has_many :trips
  has_many :emergency_funds
  has_many :retirements
  has_many :custom_goals
end
