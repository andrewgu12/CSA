class StaticPagesController < ApplicationController
	layout "application"
	def home
		render :layout => 'index'		
	end

	def about
		@pageTitle = "about"
	end

	def calendar
		@pageTitle = "calendar"
	end

	def register
		@pageTitle = "register"
	end

end
