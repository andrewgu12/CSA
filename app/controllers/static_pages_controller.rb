class StaticPagesController < ApplicationController
	layout "application"
	def home
		render :layout => 'index'
	end

	def about
		@page_title = "eboard_group_photo"
	end

	def calendar
		# @page_title = "calendar"
	end

	def register
		@page_title = "register"
	end

	def sponsors
		# @page_title = "sponsors"
	end

	def event
		@page_title = request.original_url.split('/')[4]
	end
end
