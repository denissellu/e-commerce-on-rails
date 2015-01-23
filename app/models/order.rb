class Order < ActiveRecord::Base

  has_many :orders_products, :dependent => :destroy
  belongs_to :user


  ##
  #
  # Methods
  #
  ##

  def calculate_total
    self.total_price = orders_products.inject(0.0){|sum, orders_products| sum += orders_products.price }
    save!
  end
end
