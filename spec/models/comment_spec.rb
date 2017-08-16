require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Here we are creating instance variables called post and comment
  # The yellow ones mean classes? and create! seams to be an archive something
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end
end
