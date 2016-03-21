class Backend::TestsController < Backend::ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to backend_tests_path, notice: 'Nuevo test, creado exitosamente.' }
        format.json { render :show, status: :created, location: backend_tests_path }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to [:backend, @test], notice: 'Test actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: [:backend, @test] }
      else
        format.html { render :edit }
        format.json { render json: [:backend, @test.errors], status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to backend_tests_url, notice: 'Test eliminado.' }
      format.json { head :no_content }
    end
  end

  # Preview test_preview/1
  def preview
    @test = Test.find(params[:id])
  end

  #Procesa los datos del formulario
  def preview_proccess
     if request.post?
        name = params[:name]
        email = params[:email]
        test_id = params[:test_id]
        
        # Creando un hash con las respuestas del usuario
        if Test.find(test_id)
          answ = {}
          Test.find(test_id).questions.each do |question|
            answ["question_#{question.id}"] = params["question_#{question.id}"]
          end
        end

        #Almacenando el registro en el formulario 
        actual_response = TestResponse.where(email: email, test_id: test_id).first

        if (actual_response)
          actual_response.name = name
          actual_response.response = answ
          actual_response.save
          redirect_to '/backend/tests', notice: 'Gracias por contar con nosotros, sus respuestas fueron almacenadas correctamente'
        else
          new_test = TestResponse.new(name: name, email: email, test_id: test_id, response: answ)
          new_test.save
          redirect_to '/backend/tests', notice: 'Gracias por contar con nosotros, sus respuestas fueron almacenadas correctamente'
        end
       
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :description)
    end
end
