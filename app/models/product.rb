class Product < ActiveRecord::Base
  belongs_to :category

  scope :available?, lambda{ where("availability < ?", Date.today) }
  scope :active, lambda {where(:status => true)}
  scope :inactive, lambda {where(:status => false)}

  # Validations for the product model

  validates :name, :presence => true,
    :length => { :maximum => 50 }
  validates_presence_of :price
end
