require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) do
    Question.create!(
      title: "New Question Title",
      body: "New Question Body",
      resolved: false
    )
  end

  describe "attributes" do
    it "has title, body and resolved attributes" do

      expect(question).to have_attributes(
        title: "New Question Title",
        body: "New Question Body",
        resolved: false
      )
    end
  end
end

#  It's calling a method let with a symbol argument, the second argument is
# an anyonymous function that returns a value that becomes the value of the
# symbol. In this case the value is an instance of the Question class.
# This class has a create! method that comes from ActiveRecord
# question it creates an new object, and a new row in the table.
