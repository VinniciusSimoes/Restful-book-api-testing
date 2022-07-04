require_relative "../../lib/client/auth.rb"

describe "Test case Auth" do
  let(:auth_requests) { AuthRequests.new }
  let(:obj_token) { attributes_for(:auth) }

  context "POST" do
    it "create token" do
      post_token_response = auth_requests.create_token(obj_token)
      expect(post_token_response.code).to eq(200)
      expect(post_token_response["token"]).not_to be_empty
    end

    it "create token with different username" do
      obj_token[:username] = "teste"
      post_token_response = auth_requests.create_token(obj_token)
      expect(post_token_response["reason"]).to eq("Bad credentials")
      expect(post_token_response.code).to eq(200)
    end
  end
end
