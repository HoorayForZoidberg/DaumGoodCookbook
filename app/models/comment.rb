class Comment < ApplicationRecord
  belongs_to :recipe
  belongs_to :user, foreign_key: "owner_id"
end
