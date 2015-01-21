class CategoryController < ApplicationController
	def index
		@categories = Category.sorted.active
	end
	def show
		
	end
end
