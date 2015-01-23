class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_basket
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :profile_name
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :profile_name
  end
  def check_basket
    if user_signed_in?
      # if Order.find_by_id(session[:basket_id])
      if !Order.where("id = ? AND status < 3", session[:basket_id]).blank?
        @basket = Order.find_by_id(session[:basket_id])
      else
        @basket = current_user.orders.build
        if @basket.new_record?
          @basket.save
          session[:basket_id] = @basket.id
        end
      end
    end
  end
end
