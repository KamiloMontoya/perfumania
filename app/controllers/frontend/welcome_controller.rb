class Frontend::WelcomeController < Frontend::ApplicationController
	def index
		@top_products = Product.all.order(top_position: :asc).limit(10)
	end
end
