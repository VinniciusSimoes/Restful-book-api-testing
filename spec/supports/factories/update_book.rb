require_relative "../models/update_book.rb"

FactoryBot.define do
  factory :update_booking, class: UpdateBook do
    firstname { Faker::Games::SuperMario.character.to_s }
    lastname { Faker::Name.last_name.to_s }
  end
end
