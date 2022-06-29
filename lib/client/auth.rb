class AuthRequests
  def create_token(body)
    url = "#{ENV['BASE_URI']}/auth"
    HTTParty.send('post', url,
                  headers: { 'Content-type' => 'application/json' },
                  body: body.to_json)
  end
end