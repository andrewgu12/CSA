class StaticPagesController < ApplicationController
  def home
  	render :layout => 'index'
  end

  def about
  end
end
