class ContactController < ApplicationController
  
  def new
  end

  def create
    ContactMailer.contact(email_params).deliver
    redirect_to root_path
  end

  private
    
  def email_params
     params.require(:contact).permit(:first_name, :last_name, :email, :company_name, :job_title, :question)
  end

end
