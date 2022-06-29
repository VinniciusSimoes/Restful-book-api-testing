require_relative '../../lib/client/booking'
require_relative '../../lib/client/auth'

describe('Test Case Booking') do
  let(:booking_requests) { BookingRequests.new }
  let(:auth_requests) { AuthRequests.new }
  let(:obj_booking) { attributes_for(:book) }
  let(:obj_token) { attributes_for(:auth) }

  context('POST') do
    it('Create a book') do
      post_book_response = booking_requests.post_booking(obj_booking)
      expect(post_book_response.code).to eq(200)
      expect(post_book_response['bookingid']).not_to be_nil
      expect(post_book_response['booking']['firstname']).to eq(obj_booking[:firstname])
      expect(post_book_response['booking']['lastname']).to eq(obj_booking[:lastname])
    end
  end

  context('GET') do
    let(:post_booking) { booking_requests.post_booking(obj_booking) }
    let(:booking_id) { post_booking['bookingid'] }

    it('search booking by id') do
      get_booking_response = booking_requests.get_booking_by_id(booking_id)
      expect(get_booking_response.code).to eq(200)
      expect(get_booking_response['firstname']).to eq(obj_booking[:firstname])
    end

    it('search bookingid') do
      get_bookingid_response = booking_requests.get_bookingid
      expect(get_bookingid_response.code).to eq(200)
      expect(get_bookingid_response.select { |ids| ids == booking_id }).to be_truthy
    end
  end

  context('PUT') do
    let(:post_token) { auth_requests.create_token(obj_token) }
    let(:post_booking) { booking_requests.post_booking(obj_booking) }
    let(:booking_id) { post_booking['bookingid'] }

    it('updating additionalneeds') do
      token = post_token['token']
      obj_booking[:additionalneeds] = 'spa'
      put_booking_response = booking_requests.put_booking(booking_id, obj_booking, token)
      expect(put_booking_response.code).to eq(200)
      expect(put_booking_response['additionalneeds']).to eq(obj_booking[:additionalneeds])
    end
  end

  context('DELETE') do
    let(:post_token) { auth_requests.create_token(obj_token) }
    let(:post_booking) { booking_requests.post_booking(obj_booking) }
    let(:booking_id) { post_booking['bookingid'] }

    it('deleting a book') do
      token = post_token['token']
      delete_booking_response = booking_requests.delete_booking(booking_id, token)
      expect(delete_booking_response.code).to eq(201)
      expect(delete_booking_response.body).to eq('Created')
    end
  end
end
