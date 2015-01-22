Fabricator(:product) do
  category_id {[*1..5].sample}
  name { Faker::Commerce.product_name }
  price { Faker::Commerce.price  }
  description {Faker::Lorem.paragraph}
  # image 'http://placehold.it/350x260'
  availability	{Faker::Date.between(30.days.ago, 30.days.from_now)}
  status {[true, false].sample}
end
