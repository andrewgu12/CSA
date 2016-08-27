class AuxiliaryMailer < ActionMailer::Base
  self.postmark_settings = { api_key: ENV["POSTMARK_API_KEY"] }
  default from:"mjiang18@umd.edu"

  def application(auxiliary)
    @auxiliary = auxiliary
    mail(
      :subject => email_subject,
      :to => receiver,
      :track_opens => "true"
    )
  end
  private

  def receiver
    # Set receiving email
    case Rails.env
      when "development"
        "watsuplin@gmail.com"
      when "production"
        "csacollegepark@gmail.com, lilizheng96@gmail.com, rchen128@umd.edu, andrew.m.gu@gmail.com, watsuplin@gmail.com"
    end
  end

  def email_subject
    "New AO Application"
  end

end

