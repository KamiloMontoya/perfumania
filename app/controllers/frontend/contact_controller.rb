class Frontend::ContactController < Frontend::ApplicationController
	def index
	end

	def contact_proccess
     if request.post?

        new_contact = Contact.new(name: params[:name], email: params[:email], phone: params[:phone], message: params[:message])
        new_contact.save
        redirect_to frontend_contact_path , notice: 'Gracias por contar con nosotros, sus datos fueron almacenados correctamente'
        
     end
   	end

end