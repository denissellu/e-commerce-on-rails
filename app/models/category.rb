class Category < ActiveRecord::Base
  # Make sure dependent is not delete
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category",:foreign_key=>"parent_id"

  has_many :products
end
