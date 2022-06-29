require_relative '../models/booking'
require_relative '../models/checkin_checkout.rb'

FactoryBot.define do
  factory :book, class: Booker do
    firstname { Faker::Name.first_name.to_s }
    lastname { Faker::Name.last_name.to_s }
    totalprice { Faker::Commerce.price(range: 100.0..1000.0, as_string: true).to_s }
    depositpaid { true }
    bookingdates { attributes_for(:bookingdates) }
    additionalneeds { 'Breakfast'}
  end
end