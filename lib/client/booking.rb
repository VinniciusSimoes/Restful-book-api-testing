class BookingRequests
  def get_booking_by_id(id)
    url = "#{ENV["BASE_URI"]}/booking/#{id}"
    HTTParty.send("get", url,
                  headers: { "Content-type" => "application/json" })
  end

  def get_bookingid
    url = "#{ENV["BASE_URI"]}/booking"
    HTTParty.send("get", url,
                  headers: { "Content-type" => "application/json" })
  end

  def post_booking(body)
    url = "#{ENV["BASE_URI"]}/booking"
    HTTParty.send("post", url,
                  headers: { "Content-type" => "application/json" },
                  body: body.to_json)
  end

  def put_booking(id, body, token)
    url = "#{ENV["BASE_URI"]}/booking/#{id}"
    HTTParty.send("put", url,
                  headers: { "Content-type" => "application/json",
                             "Accept" => "application/json",
                             "Cookie" => "token=#{token}" },
                  body: body.to_json)
  end

  def patch_booking(id, body, token)
    url = "#{ENV["BASE_URI"]}/booking/#{id}"
    HTTParty.send("patch", url,
                  headers: { "Content-type" => "application/json",
                             "Cookie" => "token=#{token}" },
                  body: body.to_json)
  end

  def delete_booking(id, token)
    url = "#{ENV["BASE_URI"]}/booking/#{id}"
    HTTParty.send("delete", url,
                  headers: { "Content-type" => "application/json",
                             "Cookie" => "token=#{token}" })
  end
end
