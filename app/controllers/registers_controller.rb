require 'google/api_client'
require 'google_drive'

class RegistersController < ApplicationController
  def new
	@register = Register.new
	@page_title = "register"
  end

  def create
    @page_title = "register"
	@register = Register.new(register_params)
	RegistrationInsert.insert(@register)
	RegistrationMailer.application(@register)
  end

  private
	def register_params
	  params.require(:register).permit(:firstName, :lastName, :shirtSize, :year, :email)
	end
end
