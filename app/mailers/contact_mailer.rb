class ContactMailer < ActionMailer::Base

  # self.postmark_settings = { api_key: "62fe62df-c038-4107-8dd5-f877c9a1a65a"}
  # default from: "umdcsahelp@gmail.com"
  # def contact(contact)
  #   @contact = contact
  #   mail(
  #     :subject => email_subject(contact),
  #     :to => receiver,
  #     :track_opens => "true"
  #   )
  # end

  # private

  # def receiver
  #   # Set receiving email
  #   case Rails.env
  #     when "development"
  #       "matthewljiang@gmail.com"
  #     when "production"
  #       ""
  #   end
  # end

  # def email_subject(contact)
  #   # Format for email subject 
  #   # Given first_name, last_name, email, company_name, job_title, question
  #   "Developer Site contact submission from #{contact['first_name']} #{contact['last_name']}"
  # end

end

