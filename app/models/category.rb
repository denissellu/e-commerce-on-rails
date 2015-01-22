class Category < ActiveRecord::Base
  # Make sure dependent is not delete
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category",:foreign_key=>"parent_id"

  has_many :products

  scope :visible_homepage, lambda {where(:visible_homepage => true)}
  scope :active, lambda {where(:status => true)}
  scope :inactive, lambda {where(:status => false)}
  scope :sorted, lambda { order("categories.id ASC")}
  scope :newest_first, lambda { order("categories.created_at DESC")}
  scope :parent_cat, lambda { where(:parent_id => nil)}
end
