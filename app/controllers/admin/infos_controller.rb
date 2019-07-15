module Admin
  class InfosController < ApplicationController

    layout 'admin'

    def index
      @infos = Info.all
    end

    def show
      @info = Info.find(params[:id])
    end

    def new
      @info = Info.new
    end

    def edit
      @info = Info.find(params[:id])
    end

    def create
      @info = Info.new(info_params)

      respond_to do |format|
        if @info.save
          format.html { redirect_to admin_info_path(@info), notice: 'info criado.' }
          format.json { render :show, status: :created, location: @info }
        else
          format.html { render :new }
          format.json { render json: @info.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @info = Info.find(params[:id])
      respond_to do |format|
        if @info.update(info_params)
          format.html { render :show }
          format.json { render :show, status: :ok, location: @info }
        else
          format.html { render :edit }
          format.json { render json: @info.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @info = Info.find(params[:id])
      @info.destroy

      respond_to do |format|
        format.html { redirect_to [:admin, @info], notice: 'info excluído.' }
        format.json { head :no_content }
      end
    end

    private
      def set_info
        @info = Info.find(params[:id])
      end

      def info_params
        params.require(:info).permit(:name, :desc, :email, :tel, :behance, :instagram, :facebook, :photo, :wpp, :logo)
      end
  end
end
