class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates_uniqueness_of :user_id, scope: :micropost_id
end
