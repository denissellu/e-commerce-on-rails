Fabricator(:category) do
  name { Faker::Commerce.department(1) }
  status true
  visible_homepage	true
end