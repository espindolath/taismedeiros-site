module Admin
  class ContactsController < ApplicationController

    layout 'admin'

    def index
      @contacts = Contact.all
    end

    def show
      @contact = Contact.find(params[:id])
    end

    def new
      @contact = Contact.new
    end

    def edit
      @contact = Contact.find(params[:id])
    end

    def create
      @contact = Contact.new(contact_params)

      respond_to do |format|
        if @contact.save
          format.html { redirect_to admin_contact_path(@contact), notice: 'contact criado.' }
          format.json { render :show, status: :created, location: @contact }
        else
          format.html { render :new }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @contact = Contact.find(params[:id])
      respond_to do |format|
        if @contact.update(contact_params)
          format.html { render :show }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :edit }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy

      respond_to do |format|
        format.html { redirect_to [:admin, @contact], notice: 'contato excluído.' }
        format.json { head :no_content }
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
end
