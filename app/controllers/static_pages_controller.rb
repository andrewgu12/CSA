class StaticPagesController < ApplicationController
	layout "application"
	def home
		render :layout => 'index'
	end

	def about
	end

	def events
	end

	def contact
	end

	def register
	end

end
