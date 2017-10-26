require 'rails_helper'

RSpec.describe SpostsController, type: :controller do
  let(:my_topic) do
    Topic.create!(
      name:  RandomData.random_sentence,
      description: RandomData.random_paragraph
    )
  end

  let(:my_spost) do
    my_topic.sposts.create!(
      title: RandomData.random_sentence,
      body:  RandomData.random_paragraph,
      price: RandomData.random_price
    )
  end

  describe 'GET show' do
    it 'returns http success' do
      get :show, params: { topic_id: my_topic.id, id: my_spost.id }

      expect(response).to have_http_status(:success)
    end

    it 'renders the #show view' do
      get :show, params: { topic_id: my_topic.id, id: my_spost.id }

      expect(response).to render_template :show
    end

    it 'assigns my_post to @post' do
      get :show, params: { topic_id: my_topic.id, id: my_spost.id }

      expect(assigns(:spost)).to eq(my_spost)
    end
  end

  describe 'GET #new' do
     it 'returns http success' do
       get :new, params: { topic_id: my_topic.id }

    expect(response).to have_http_status(:success)
     end

     it 'renders the #new view' do
       get :new, params: { topic_id: my_topic.id }

      expect(response).to render_template :new
    end

     it 'instantiates @spost' do
      get :new, params: { topic_id: my_topic.id }

      expect(assigns(:spost)).not_to be_nil
    end
  end

  describe 'SPOST create' do
    # #4
    it 'increases the number of Spost by 1' do
      expect do
        post :create, params: {
          topic_id: my_topic.id,
          spost: {
            title: RandomData.random_sentence,
            body: RandomData.random_paragraph,
            price: RandomData.random_price
          }
        }
      end.to change(Spost, :count).by(1)
    end

    it 'assigns the new post to @spost' do
      post :create, params: {
        topic_id: my_topic.id,
        spost: {
          title: RandomData.random_sentence,
          body: RandomData.random_paragraph,
          price: RandomData.random_price
        }
      }
      expect(assigns(:spost)).to eq Spost.last
    end

    it 'redirects to the new spost' do
      post :create, params: {
        topic_id: my_topic.id,
        spost: {
          title: RandomData.random_sentence,
          body: RandomData.random_paragraph,
          price: RandomData.random_price
        }
      }
      expect(response).to redirect_to [my_topic, Spost.last]
    end
  end

  describe 'GET edit' do
    it 'returns http success' do
      get :edit, params: { topic_id: my_topic.id, id: my_spost.id }

      expect(response).to have_http_status(:success)
    end

    it 'renders the #edit view' do
      get :edit, params: { topic_id: my_topic.id, id: my_spost.id }

      expect(response).to render_template :edit
    end

    it 'assigns post to be updated to @post' do
      get :edit, params: { topic_id: my_topic.id, id: my_spost.id }

      spost_instance = assigns(:spost)

      expect(spost_instance.id).to eq my_spost.id
      expect(spost_instance.title).to eq my_spost.title
      expect(spost_instance.body).to eq my_spost.body
    end
  end

  describe 'PUT update' do
    it 'updates spost with expected attributes' do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = RandomData.random_price

      put :update, params: { topic_id: my_topic.id, id: my_spost.id, spost: { title: new_title, body: new_body, price: new_price} }

      updated_spost = assigns(:spost)

      expect(updated_spost.id).to eq my_spost.id
      expect(updated_spost.title).to eq new_title
      expect(updated_spost.body).to eq new_body
      expect(updated_spost.price).to eq new_price
    end

    it 'redirects to the updated post' do
      new_title  =   RandomData.random_sentence
      new_body   =   RandomData.random_paragraph
      new_price  =   RandomData.random_price

      put :update, params: { topic_id: my_topic.id, id: my_spost.id, spost: { title: new_title, body: new_body, price: new_price} }

      expect(response).to redirect_to [my_topic, my_spost]
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the spost' do
      delete :destroy, params: { topic_id: my_topic.id, id: my_spost.id }

      count = Post.where(id: my_spost.id).size
      expect(count).to eq 0
    end

    it 'redirects to topic show ' do
      delete :destroy, params: { topic_id: my_topic.id, id: my_spost.id }

      expect(response).to redirect_to my_topic
    end
  end
end
