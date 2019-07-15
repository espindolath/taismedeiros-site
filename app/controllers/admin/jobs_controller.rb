module Admin
  class JobsController < ApplicationController

    layout 'admin'

    def index
      @jobs = Job.order(year: :desc, month: :desc, client: :desc).all
    end

    def show
      @job = Job.find(params[:id])
    end

    def new
      @job = Job.new
    end

    def edit
      @job = Job.find(params[:id])
    end

    def create
      @job = Job.new(job_params)

      respond_to do |format|
        if @job.save
          format.html { redirect_to admin_job_path(@job), notice: 'case criado.' }
          format.json { render :show, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @job = Job.find(params[:id])
      respond_to do |format|
        if @job.update(job_params)
          format.html { render :show }
          format.json { render :show, status: :ok, location: @job }
        else
          format.html { render :edit }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @job = Job.find(params[:id])
      @job.destroy

      respond_to do |format|
        format.html { redirect_to [:admin, @job], notice: 'case excluído.' }
        format.json { head :no_content }
      end
    end

    private
      def set_job
        @job = Job.find(params[:id])
      end

      def job_params
        params.require(:job).permit(:title, :desc, :client, :year, :month, :words, {images: []},{covers: []})
      end
  end
end
