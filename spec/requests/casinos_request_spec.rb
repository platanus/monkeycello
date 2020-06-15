require 'rails_helper'

RSpec.describe "Casinos", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/casinos/show"
      expect(response).to have_http_status(:success)
    end
  end

end
