class JobsController < ApplicationController
  before_action :set_job, only: [:show]

  layout 'application-regular'

  def index
    @jobs = Job.order(year: :desc, month: :desc, client: :desc).all
  end

  def show
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end
end
