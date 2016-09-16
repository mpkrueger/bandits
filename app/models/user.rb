class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  belongs_to :family
  has_many :topics
  has_many :invitations, class_name: "Invite", foreign_key: 'recipient_id'
  has_many :sent_invites, class_name: "Invite", foreign_key: 'sender_id'
  has_many :comments
  has_many :to_dos

  def my_partner
    if self.family.users.count < 2
      return nil
    else
      partner = self.family.users.where("first_name != ?", self.first_name).first
      return partner
    end
  end
end
