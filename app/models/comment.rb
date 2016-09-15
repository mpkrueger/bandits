class Comment < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :goal, optional: true
  belongs_to :user

  default_scope { order('updated_at ASC') }
end
