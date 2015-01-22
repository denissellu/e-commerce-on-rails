class ProductsController < ApplicationController

  def show
    @product = Product.where(:id => params[:id], :status => true).first
    if @product.nil?
      redirect_to(:controller => 'home', :action => 'index')
    
    end
  end
end
