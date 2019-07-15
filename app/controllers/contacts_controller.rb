class ContactsController < ApplicationController
  layout 'application-regular'
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Sua mensagem foi enviada.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :tel, :messsage)
    end
end
