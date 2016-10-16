require 'google/api_client'
require 'google_drive'
require 'mailchimp'

class RegistersController < ApplicationController
  def new
    @register = Register.new
    @page_title = "register"
  end

  def create
    @page_title = "register"
    @register = Register.new(register_params)
    RegistrationInsert.delay.insert(@register)
    RegistrationMailer.application(@register).deliver_now
  end

  private
  def register_params
   params.require(:register).permit(:firstName, :lastName, :shirtSize, :year, :email)
 end
end
