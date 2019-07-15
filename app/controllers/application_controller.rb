class ApplicationController < ActionController::Base
	before_action :fill_infos

	private

	def fill_infos
		@infos = Info.all
	end
end
