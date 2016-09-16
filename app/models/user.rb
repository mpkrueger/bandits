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

  def my_partner_name
    if self.family.users.count < 2
      if self.sent_invites.present?
        return self.sent_invites.first.first_name
      else
        return "your partner"
      end
    else
      partner = self.family.users.where("first_name != ?", self.first_name).first
      return partner.first_name
    end
  end

  def my_partner_email
    if self.family.users.count < 2
      if self.sent_invites.present?
        return self.sent_invites.first.email
      else
        return nil
      end
    else
      partner = self.family.users.where("first_name != ?", self.first_name).first
      return partner.email
    end
  end
end
