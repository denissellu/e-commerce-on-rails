class HomeController < ApplicationController


  def index
    @categories_home = Category.sorted.active.visible_homepage
  end

end
