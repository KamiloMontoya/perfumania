class Frontend::TestController < Frontend::ApplicationController
  
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
          redirect_to '/', notice: 'Gracias por contar con nosotros, sus respuestas fueron almacenadas correctamente'
        else
          new_test = TestResponse.new(name: name, email: email, test_id: test_id, response: answ)
          new_test.save
          redirect_to '/', notice: 'Gracias por contar con nosotros, sus respuestas fueron almacenadas correctamente'
        end
       
     end
   end
end
