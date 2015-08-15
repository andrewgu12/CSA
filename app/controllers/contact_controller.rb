class ContactController < ApplicationController
  
  def new
    @page_title = "contact_us"
  end

  def create
    ContactMailer.contact(email_params).deliver_now
    redirect_to contact_path, :notice => "Your question has been sent!"
  end

  private
    
  def email_params
     params.require(:contact).permit(:first_name, :last_name, :email, :question)
  end

end
