require_relative '../models/auth'

FactoryBot.define do
  factory :auth, class: Auth do
    username { 'admin' }
    password { 'password123' }
  end
end
