class BasketController < ApplicationController

  before_action :authenticate_user!

  def show
    # change the order position
    @basket.update_progress(1)
    @basket.calculate_total
  end



  def add
    product = Product.find(params[:id])

    # Check to see if the product exist on this order, if so incrment quantity
    order_product = OrdersProduct.product_exsit?(params[:id],session[:basket_id]).first
    if order_product.blank?
      OrdersProduct.create! :order => @basket, :product => product, :price => product.price, :quantity => 1
    else
      quantity = order_product.quantity + 1
      self.update_quantity(order_product.id,quantity)
    end
    @basket.calculate_total
    @basket.update_progress(1)
    redirect_to '/basket'
  end

  def update_quantity(order_product_id,quantity)

    OrdersProduct.find(order_product_id).update_column(:quantity , quantity)
  end

  def ajax_update_quantity
    update_quantity(params[:order_product_id],params[:quantity])
    render :json => params
  end

  def checkout
    @addresses = User.find(current_user.id).addresses
    @basket.update_progress(2)
  end

  def delete
    product = @basket.orders_products.find(params[:id])
    product.destroy
    @basket.calculate_total
    redirect_to '/basket'
  end

  def complete
    @basket.update_progress(3)
    Basket.order_complete_mail(@basket).deliver_now
    redirect_to '/'
  end


  protected



  def order_products_params(quantity)
    params.require(:OrdersProduct).permit(:quantity => quantity)
  end

end
