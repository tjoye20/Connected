require 'rails_helper'

RSpec.describe UsersController, type: :controller do

let(:user) { User.create!(username:"jay", email:"jay@gmail.com", password: "1234") }

  describe "GET #index" do
    before(:each) do
      session[:user_id] = user.id
    end
    it "responds with status code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status 200
      # expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to be_success
      expect(assigns(:user)).to be_a_new User
      expect(response).to have_http_status 200
      # expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, {id: user.id}
      expect(response).to be_success
      expect(assigns(:user)).to eq(user)
      expect(response).to have_http_status 200
      # expect(response).to render_template(:show)
    end
  end

  describe "GET #edit" do
    it "responds with status code 200" do
      get :edit, {id: user.id}
      expect(response).to be_success
      expect(assigns(:user)).to eq(user)
      expect(response).to have_http_status 200
      # expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      let :params do
        {user: {username: "tom4", email: "t4tom@test.com", password: "tomdancer"}}
      end

      it "responds with status code 302" do
        expect{post(:create, params)}.to change(User, :count).by(1)
        expect(response).to have_http_status 302
        expect(session[:user_id]).to eq(User.last.id)
        expect(flash[:notice]).to eq("Signup successful!")
        expect(response).to redirect_to users_path
      end
    end

    context "when invalid params are passed" do
      let :params do
        {user: {username: "Tom", email: "t4tom@test.com"}}
      end
      it "responds with status code 200" do
        post :create, params
        expect(response).to have_http_status 200
        # expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    context "when valid params are passed" do
      before(:each) do
        session[:user_id] = user.id
        put :update, id: user.id, user: params
        user.reload
      end
      let :params do
        {email: "tomtest@tom.com"}
      end

      it "updates the specified user's attribute" do
        expect(response).to have_http_status 302
        expect(user.email).to eq params[:email]
        expect(response).to redirect_to user_path(user.id)
      end
    end

      context "when invalid params are passed" do
        before(:each) do
          session[:user_id] = nil
          put :update, id: user.id, user: params
          user.reload
        end
        let :params do
          {email: "tomtest@tom.com"}
        end
        it "responds with a status 302" do
        expect(response).to have_http_status 302
        expect(user.bio).to_not eq params[:bio]
        expect(response).to redirect_to new_session_path
      end
    end
  end

  describe "DELETE #destroy" do
    it "logs out user, clears the session, and sets active to false" do
      delete :destroy, {id: user.id}
      expect(session[:user_id]).to eq nil
      expect(assigns(:user)).to eq nil
      expect(response).to redirect_to root_path
    end
  end

end
