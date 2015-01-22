class CategoryController < ApplicationController
	def index
		@categories_home = Category.sorted.active.visible_homepage
	end
	def show
		
	end
end
