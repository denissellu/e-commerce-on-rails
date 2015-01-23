class OrdersProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product


  scope :product_exsit?, lambda {|product_id,order_id| where("product_id = ? AND order_id = ?", product_id,order_id)}


end
