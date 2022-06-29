require_relative '../models/checkin_checkout'

FactoryBot.define do
  factory :bookingdates do
    checkin { "2018-01-01" }
    checkout { "2018-02-01" }
  end
end
