class ProductosController < ApplicationController
	def index
		@all_productos = Producto.all
	end

	def new
	end
	def create
		@producto = Producto.new(producto_params)

		algo = @producto.save

		if algo
			@rta = 'producto creado exitosamente'
		else
			@rta = 'no creado'
		end
		redirect_to @producto
	end
	def show
		 @producto = Producto.find(params[:id])
	end

	private
  		def producto_params
    		params.require(:producto).permit(:title, :text)
  		end
end
