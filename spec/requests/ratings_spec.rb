require 'rails_helper'

RSpec.describe "Ratings", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/ratings/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/ratings/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/ratings/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
