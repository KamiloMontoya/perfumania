class Frontend::ContactController < Frontend::ApplicationController
	def index
	end

	def contact_proccess
     if request.post?
     	#Almacenando el registro en la base de datos 
        actual_contact = Contact.where(email: params[:email]).first
        if (actual_contact)
          actual_contact.name = params[:name]
          actual_contact.phone = params[:phone]
          actual_contact.message = params[:message]
          actual_contact.read_contact = 0
          actual_contact.save
        else
	        new_contact = Contact.new(name: params[:name], email: params[:email], phone: params[:phone], message: params[:message], read_contact: 0)
	        new_contact.save
        end
        redirect_to frontend_contact_path , notice: 'Gracias por contar con nosotros, sus datos fueron almacenados correctamente'
     end
   	end

end