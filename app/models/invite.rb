class Invite < ApplicationRecord
  belongs_to :family
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  before_create :generate_token

  def generate_token
  	self.token = Digest::SHA1.hexdigest([self.family_id, Timelnow, rand].join)
  end
end
