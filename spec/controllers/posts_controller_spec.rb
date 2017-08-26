require 'rails_helper'


#  Here we created a test for PostsController.
#  "type: :controller" so we can do HTTP requests
RSpec.describe PostsController, type: :controller do

  #8 We are defining a symbol named :my_post
  # and this is so we can refer to it later.
  # This let(:my_post) will create an instance of Post
  # Each instance contains one argument, a hash
  let(:my_post) {
    Post.create!(
      title: RandomData.random_sentence,
      body:  RandomData.random_paragraph
    )
  }
  describe "GET #index" do
    it "returns http success" do
      get :index

      # get( :index ) This test is simulating sending a get request.
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
      get :index

      expect(assigns(:posts)).to eq([my_post])
    end


  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
