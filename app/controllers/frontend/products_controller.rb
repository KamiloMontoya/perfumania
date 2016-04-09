class Frontend::ProductsController < Frontend::ApplicationController
	def index
	end

	# GET /products/{id} id = Category_id
  	# GET /products/1.json
	def show
		@category = params[:id].to_i
		@products = Product.where(category_id: @category).order(top_position: :asc).page(params[:page]).per(15)
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

	def product_related
		product = Product.find(params[:id])

		query = Product.where("note_id = ?", product.note_id).order(top_position: :asc).limit(10)
		i = 0;
		related_products = Hash.new 
		query.each do |product|
			related_products[i] = {'id' => product.id, 
									'name' => product.name, 
									'img_thumb_url' => product.image.url(:thumb),
									'img_original_url' => product.image.url(:original),
									'img_medium_url'=> product.image.url(:medium) }
			i = i+1
		end		

		respond_to do |format|
	        format.json { render json: {"related_products" => related_products }}
	      end
	end


end
