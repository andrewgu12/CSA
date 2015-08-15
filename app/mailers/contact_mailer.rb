class ContactMailer < ActionMailer::Base

  self.postmark_settings = { api_key: ENV["POSTMARK_API_KEY"]}
  default from: "mjiang18@umd.edu"
  def contact(contact)
    @contact = contact
    mail(
      :subject => email_subject(contact),
      :to => receiver,
      :track_opens => "true"
  )
  end

  private

  def receiver
    # Set receiving email
    case Rails.env
      when "development"
        "matthewljiang@gmail.com"
      when "production"
        "csacollegepark@gmail.com"
    end
  end

  def email_subject(contact)
    # Format for email subject 
    # Given first_name, last_name, email, company_name, job_title, question
    "Contact us email from #{contact['first_name']} #{contact['last_name']}"
  end

end

