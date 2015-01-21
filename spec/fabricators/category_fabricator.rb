Fabricator(:category) do
  name { Faker::Commerce.department(1) }
  status {[true, false].sample}
  visible_homepage	{[true, false].sample}
end