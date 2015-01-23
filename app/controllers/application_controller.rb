class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_basket

  private
  def check_basket
    if session[:basket_id]
      @basket = Order.find(session[:basket_id])
    else
      @basket = current_user.orders.build
      if @basket.new_record?
        @basket.save
      end
    end
  end
end
