require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do
  describe "GET /help" do
    it "returns a successful response" do
      get :help
      expect(response.status).to eq(200)
    end
  end

  describe "GET /home" do
    it "returns a successful response" do
      get :home
      expect(response.status).to eq(200)
    end
  end

  describe "GET /contact" do
    it "returns a successful response" do
      get :contact
      expect(response.status).to eq(200)
    end
  end
end
