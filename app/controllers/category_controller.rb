class CategoryController < ApplicationController
  add_breadcrumb "Home", :root_path, :options => { :title => "Home" }


  def index
    @categories_home = Category.sorted.active.visible_homepage
  end


  def show

    @category = Category.where(:id => params[:id], :status => true).first
    @products  = Product.where(category_id: @category.id).available?.active
    if !@category.parent_id.nil?
      @parent_category = Category.where(:id => @category.parent_id, :status => true).first
      add_breadcrumb @parent_category.name,"/category/show/#{@parent_category.id}", :title => "Back to the #{@parent_category.name}"
    else
      @sub_category = Category.where(:parent_id => @category.id, :status => true)

    end
    add_breadcrumb @category.name,"/category/show/#{@category.id}", :title => " #{@category.name}"


  end
end
