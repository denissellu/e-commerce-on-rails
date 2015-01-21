Fabricator(:product) do
	category
  name { Faker::Commerce.product_name }
  price { Faker::Commerce.price  }
  status true
end