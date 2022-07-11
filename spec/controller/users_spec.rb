require "rails_helper"
require "./support/shared_context_for_log_in.rb"

describe UsersController, type: :controller do
  include_context "logged in as user"

  describe "GET /index" do
    context "from logged in user" do

      it "should return a status code of 200" do
        get :index
        expect(response).to have_http_status :success
      end
    end

    context "from not logging in user" do
      it "should redirect to login page" do
        get :index
        expect(response).to redirect_to :login
      end
    end
  end

  describe "GET /show" do
    context "from logged in user" do
      it "should return a status code of 200" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status :success
      end
    end
  end
end
