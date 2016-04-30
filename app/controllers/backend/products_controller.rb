class Backend::ProductsController < Backend::ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /products
  # GET /products.json
  def index
    #Se arma un hash con todos los filtros
    sentencia = []
    if (params[:filter_name] && params[:filter_name].to_s != '')
      sentencia.push("( name LIKE '%#{params[:filter_name]}%' OR description LIKE '%#{params[:filter_name]}%' )")
    end
    if (params[:filter_categories] && params[:filter_categories].to_s != '') 
      sentencia.push("( category_id=#{params[:filter_categories]} )")
    end
    if (params[:filter_notes] && params[:filter_notes].to_s != '')
      sentencia.push("( note_id=#{params[:filter_notes]} )")
    end

    if sentencia.length == 0
      @products = Product.order(top_position: :asc).page(params[:page]).per(10)
    else
      @products = Product.order(top_position: :asc).page(params[:page]).per(10).where(sentencia.join(' AND '))
    end

    @notes = Note.all.collect {|n| [ n.name, n.id ] }
    @notes << ['Seleccione Una','']
    
    @categories = Category.all.collect {|n| [ n.name, n.id ] }
    @categories << ['Seleccione Una','']
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    product_params[:name] = product_params[:name].encode("UTF-8", :invalid=>:replace, :replace=>" ")
    product_params[:description] = product_params[:description].encode("UTF-8", :invalid=>:replace, :replace=>" ")
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to backend_products_url, notice: 'Producto creado exitosamente.' }
        format.json { render :show, status: :created, location: [:backend, @product] }
      else
        format.html { render :new }
        format.json { render json: [:backend, @product.errors], status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      product_params[:name] = product_params[:name].encode("UTF-8", :invalid=>:replace, :replace=>" ")
      product_params[:description] = product_params[:description].encode("UTF-8", :invalid=>:replace, :replace=>" ")
    
      if @product.update(product_params)
        format.html { redirect_to backend_products_url, notice: 'Producto actualizado.' }
        format.json { render :show, status: :ok, location: [:backend, @product] }
      else
        format.html { render :edit }
        format.json { render json: [:backend, @product.errors], status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to backend_products_url, notice: 'Producto eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :category_id, :segment_id, :image, :top_position, :note_id, :video_path)
    end
end
