require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) do
    Question.create!(
      title: "New Question Title",
      body: "New Question Body",
      resolved: true
    )
  end

  let(:answer) do
    Answer.create!(
      question: question,
      body: "New Answer Body"
    )
  end

  describe "attributes" do
    it "has reference and body attributes" do

      expect(answer).to have_attributes(
        body: "New Answer Body"
      )
      expect(answer).to respond_to(:question)
    end
  end
end
