require_relative "../../lib/client/ping.rb"

module SetupTests
  include FactoryBot::Syntax::Methods

  def self.included(base)
    $get_ping_request = get_ping_request
  end

  def get_ping_request
    ping_calls = PingRequests.new
    get_ping_response = ping_calls.get_healthcheck
    puts "Integrity checking to confirm the API is working. Waiting..."
    return get_ping_response
  end
end
