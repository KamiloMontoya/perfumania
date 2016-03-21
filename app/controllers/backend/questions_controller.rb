class Backend::QuestionsController < Backend::ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    puts question_params.inspect
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        # format.html { redirect_to @question, notice: 'Question was successfully created.' } 
        format.html { redirect_to backend_test_path(@question.test_id.to_s), notice: 'Pregunta Añadida.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [:backend, @question], notice: 'Pregunta actualizada correctamente.' }
        format.json { render :show, status: :ok, location: [:backend, @question] }
      else
        format.html { render :edit }
        format.json { render json: [:backend, @question.errors], status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      #format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.html { redirect_to backend_test_path(@question.test_id.to_s), notice: 'Pregunta eliminada satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :type_question_id, :test_id)
    end
end
