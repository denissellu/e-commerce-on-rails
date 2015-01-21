class HomeController < ApplicationController


  def index
  	@categories = Category.sorted.visible_homepage.active
  end

  private

end
