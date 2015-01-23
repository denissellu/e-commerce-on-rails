class ProductsController < ApplicationController
  add_breadcrumb "Home", :root_path, :options => { :title => "Home" }
  def show
    @product = Product.where(:id => params[:id], :status => true).first
    if @product.nil?
      redirect_to(:controller => 'home', :action => 'index')
    end

    @category = Category.where(:id => @product.category_id, :status => true).first

    if !@category.parent_id.blank?
      @parent_category = Category.where(:id => @category.parent_id, :status => true).first
      add_breadcrumb @parent_category.name,"/category/show/#{@parent_category.id}", :title => "Back to the #{@parent_category.name}"
    end
    add_breadcrumb @category.name,"/category/show/#{@category.id}", :title => " #{@category.name}"
    add_breadcrumb @product.name, "/products/show/#{@product.id}", :title => ""

  end
end
