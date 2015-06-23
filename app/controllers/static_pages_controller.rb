class StaticPagesController < ApplicationController
	layout "application"
	def home
		render :layout => 'index'
	end

	def about
	end


end
