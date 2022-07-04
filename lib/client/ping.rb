class PingRequests
  def get_healthcheck
    url = "#{ENV["BASE_URI"]}/ping"
    HTTParty.send("get", url,
                  headers: { "Content-type" => "application/json" })
  end
end
