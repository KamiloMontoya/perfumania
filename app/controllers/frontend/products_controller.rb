class Frontend::ProductsController < Frontend::ApplicationController
	def index
	end

	# GET /products/{id} id = Category_id
  	# GET /products/1.json
	def show
		@category = params[:id]
		@products = Product.where(category_id: @category)
	end
end
