class StaticPagesController < ApplicationController
	layout "application"
	def home
		render :layout => 'index'
	end

	def about
	end

	def calendar
	end

	def register
	end

end
