# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    let!(:posts) { create_list(:post, 3) }

    before { get :index }

    it 'populates array of all posts' do
      expect(assigns(:posts)).to match_array(posts)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end

    it 'returns the number of posts' do
      expect(assigns(:posts_count)).to be == (3)
    end
  end

  describe 'GET #show' do
    let(:post) { create(:post) }
    let!(:comments) { create_list(:comment, 3, post_id: post.id) }

    before do
      get :show, params: { id: post.id }
    end

    it 'assings the requested post to @post' do
      expect(assigns(:post)).to eq post
    end

    it 'assings the requested comments to @comments' do
      expect(assigns(:comments)).to match_array(comments)
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    let(:user) { create(:user) }

    before do
      sign_in(user, scope: :user) # Used Devise::Test::ControllerHelpers in rails_helper.rb for sign_in in test !
      get :new
    end
   
    it 'assigns a new Question to @question' do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end


  describe 'GET #edit' do
    let(:user) { create(:user) }
    let!(:post) { create(:post, user_id: user.id) }

    before do
      sign_in(user, scope: :user)              # Used Devise::Test::ControllerHelpers in rails_helper.rb for sign_in in test !
      get :edit, params: { id: post.id }
    end

    it 'assings the requested post to @post' do
      expect(assigns(:post)).to eq post
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }

      before do
        sign_in(user, scope: :user)             # Used Devise::Test::ControllerHelpers in rails_helper.rb for sign_in in test !
      end

      context 'with valid attributes' do
        it 'saves the new post in db' do
          expect { post :create, params: { post: attributes_for(:post, user_id: user) } }.to change { Post.count }.by(1)
        end

        it 'redirects to show view' do
          post :create, params: { post: attributes_for(:post, user_id: user) }
          expect(response).to redirect_to posts_path
        end
      end

      context 'with invalid attributes' do
        it 'saves the new post in db' do
          expect { post :create, params: { post: attributes_for(:invalid_post, user_id: user) } }.to_not change { Post.count }
        end
        
        it 're-renders new view' do
           post :create, params: { post: attributes_for(:invalid_post, user_id: user) }
           expect(response).to render_template
        end
      end
  end

  describe 'PATCH #update' do
    let(:user) { create(:user) }
    let!(:post) { create(:post, user_id: user.id) }
    let(:updated_post) { create(:updated_post) }

      before do
        sign_in(user, scope: :user)             # Used Devise::Test::ControllerHelpers in rails_helper.rb for sign_in in test !
      end

    context 'valid attributes' do
      it 'assings the requested post to @post' do
        patch :update, params: { id: post, post: attributes_for(:post) }
        expect(assigns(:post)).to eq post
      end

      it 'changes post attributes' do
        patch :update, params: { id: post, post: attributes_for(:updated_post) }
        post.reload
        expect(post.tag).to eq (updated_post.tag)
        expect(post.body).to eq (updated_post.body)
      end

      it 'redirects to the updated post' do
        patch :update, params: { id: post, post: attributes_for(:post) }
        expect(response).to redirect_to post
      end
    end

    context 'invalid attributes' do
      before { patch :update, params: { id: post, post: attributes_for(:invalid_post) } }

      it 'does not change post attributes' do
        post.reload
        expect(post.tag).to eq (post.tag)
        expect(post.body).to eq (post.body)
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do

    let(:user) { create(:user) }
    let!(:post) { create(:post, user_id: user.id) }

    before do
      sign_in(user, scope: :user)   # Used Devise::Test::ControllerHelpers in rails_helper.rb for sign_in in test !
      post
    end          

    it 'deletes post' do
      expect { delete :destroy, params: { id: post } }.to change{Post.count}.by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: post }
      expect(response).to redirect_to posts_path
    end
  end
end
