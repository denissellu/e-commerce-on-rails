class ProductsController < ApplicationController
  add_breadcrumb "home", :root_path, :options => { :title => "Home" }
  def show
  	add_breadcrumb "index", '/', :title => "Back to the Index"
    @product = Product.where(:id => params[:id], :status => true).first
    if @product.nil?
      redirect_to(:controller => 'home', :action => 'index')
    
    end
  end
end
