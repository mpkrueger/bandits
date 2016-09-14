class Family < ApplicationRecord
	has_many :users
	has_many :invites
	has_many :goals
end
