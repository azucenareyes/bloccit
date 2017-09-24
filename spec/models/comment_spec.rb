require 'rails_helper'

RSpec.describe Comment, type: :model do
  # Here we are creating instance variables called post and comment
  # The yellow ones mean classes? and create! seams to be an archive something
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

  describe 'attributes' do
    it 'has a body attribute' do
      expect(comment).to have_attributes(body: 'Comment Body')
    end
  end
end
