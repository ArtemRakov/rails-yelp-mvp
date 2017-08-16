
Restaurant.destroy_all

5.times do
  Restaurant.create(name: Faker::Pokemon.name, address: Faker::Pokemon.location, phone_number: Faker::Number.number(10), category: %w(chinese italian japanese french belgian).sample )
end
