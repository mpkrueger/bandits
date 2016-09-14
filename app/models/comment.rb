class Comment < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :goal, optional: true
end
