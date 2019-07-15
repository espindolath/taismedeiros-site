class InfosController < ApplicationController
	layout 'application-regular'

	def index
		@infos = Info.all
	end

	private
	def set_info
	  @info = Info.find(params[:id])
	end
end
