class Post < ApplicationRecord
	has_many :comments, dependent: :destroy

	# this has_many method allows a post instance to have many
	# comments that belong to a post.
end
