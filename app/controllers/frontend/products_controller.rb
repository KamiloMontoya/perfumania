class Frontend::ProductsController < Frontend::ApplicationController
	def index
	end

	# GET /products/{id} id = Category_id
  	# GET /products/1.json
	def show
		@category = params[:id].to_i
		@products = Product.where(category_id: @category).order(top_position: :asc).page(params[:page]).per(10)
	end

	def show_all
		@products = Product.all.order(top_position: :asc)
		@categories = {1 => 'Fragancias Maculinas', 2 =>  'Fragancias Femeninas'} 
	end

	def product_detail
		product = Product.find(params[:id])
		
		respond_to do |format|
	        format.json { render json: {"product" => product, 
	        							"img_medium" => product.image.url(:medium), 
	        							"img_thumb" => product.image.url(:thumb),
	        							"video_id" => product.video_path ? product.video_path.gsub(/.*?v=/, '') : '' }}
	      end
	end


end
