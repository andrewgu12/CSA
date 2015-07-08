class EventController < ApplicationController
	layout "application"
	def event
		@pageTitle = request.original_url.split('/')[4]
	end
end