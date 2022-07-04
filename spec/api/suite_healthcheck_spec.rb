require_relative "../../lib/client/ping.rb"

describe "Test case Ping" do
  let(:ping_requests) { PingRequests.new }

  context "GET" do
    it "ping" do
      get_ping_response = ping_requests.get_healthcheck
      expect(get_ping_response.code).to eq(201)
      expect(get_ping_response.body).to eq("Created")
    end
  end
end
