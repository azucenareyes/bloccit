class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :sposts, dependent: :destroy
end
