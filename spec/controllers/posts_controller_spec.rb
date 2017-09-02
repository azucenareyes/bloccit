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

  describe "GET show" do

    it "returns http success" do
      #get is a method with on argument called :show which is a symbol.
      #the second argument is a hash with params: or params => with a value
      # which is also a hash with a key of id: or id => with a value of my_post.id

      get :show, params: { id: my_post.id }

      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: { id: my_post.id }

      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, params: { id: my_post.id }

      expect(assigns(:post)).to eq(my_post)
    end

  end

  describe "GET #new" do

    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end

  end

  describe "POST create" do
 # #4
            it "increases the number of Post by 1" do
      expect {
    post :create, {
          params: {
            post: {
              title: RandomData.random_sentence,
              body: RandomData.random_paragraph
            }
          }
        }
      }.to change(Post,:count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, {
        params: {
          post: {
            title: RandomData.random_sentence,
            body: RandomData.random_paragraph
          }
        }
      }
      expect(assigns(:post)).to eq Post.last
    end

    it "redirects to the new post" do
      post :create, {
        params: {
          post: {
            title: RandomData.random_sentence,
            body: RandomData.random_paragraph
          }
        }
      }
      expect(response).to redirect_to Post.last
    end

  end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
