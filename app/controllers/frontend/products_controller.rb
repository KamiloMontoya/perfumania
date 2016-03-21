class Frontend::ProductsController < Frontend::ApplicationController
	def index
	end

	# GET /products/{id} id = Category_id
  	# GET /products/1.json
	def show
		@category = params[:id].to_i
		@products = Product.where(category_id: @category)
	end

	def product_detail
		product = Product.find(params[:id])
		
		respond_to do |format|
	        format.json { render json: {"product" => product, 
	        							"img_medium" => product.image.url(:medium), 
	        							"img_thumb" => product.image.url(:thumb) }}
	      end
	end


end
