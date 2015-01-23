class Order < ActiveRecord::Base

  has_many :orders_products, :dependent => :destroy
  belongs_to :user
  scope :basket, ->{where("orders.status =  1")}
  scope :address, ->{where("orders.status =  2")}
  scope :complete, -> {where("orders.status = 3")}


  ##
  #
  # Methods
  #
  ##

  def calculate_total
    self.total_price = orders_products.inject(0.0){|sum, orders_products|
      sum += orders_products.price * orders_products.quantity
    }
    save!
  end
  def self.find_with_product(product)
    return [] unless product
    complete.joins(:orders_products).
      where(["orders_products.product_id = ?", product.id]).
      order("orders.checked_out_at DESC")
  end
  def update_progress(progress)
    self.status = progress
    save!
  end
end
