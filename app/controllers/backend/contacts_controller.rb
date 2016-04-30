class Backend::ContactsController < Backend::ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /contacts
  # GET /contacts.json
  def index
    #Se arma un hash con todos los filtros
    sentencia = []
    if (params[:filter_name] && params[:filter_name].to_s != '')
       sentencia.push("( name LIKE '%#{params[:filter_name]}%' )")
    end
    if (params[:filter_email] && params[:filter_email].to_s != '')
       sentencia.push("( email LIKE '%#{params[:filter_email]}%' )")
    end
    if (params[:filter_read] && params[:filter_read].to_s != '')
        if params[:filter_read].to_i == 0
          sentencia.push("( read_contact is not true )")
        else
          sentencia.push("( read_contact = true )")
        end
    end

    if sentencia.length == 0
      @contacts = Contact.all.page(params[:page]).order(updated_at: :asc).per(10)
    else
      @contacts = Contact.all.page(params[:page]).order(updated_at: :asc).per(10).where( sentencia.join(' AND ') )
    end
    
  end

  # GET /contacts/1/edit
  def edit
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to backend_contacts_url, notice: 'Contacto actualizado.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to backend_contacts_url, notice: 'Contacto eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message, :read_contact)
    end
end
