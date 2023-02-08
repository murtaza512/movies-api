# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    name { Faker::Movie.quote }
    genre { Faker::Book.genre }
    thumbnail { Faker::Internet.url }
    image { Faker::Internet.url }
    owner { Faker::Name.name }
    market_price { Faker::Commerce.price }
  end
end
