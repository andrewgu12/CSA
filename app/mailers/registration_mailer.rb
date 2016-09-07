class RegistrationMailer < ActionMailer::Base
  self.postmark_settings = {api_key: ENV["POSTMARK_API_KEY"]}
  default from: "mjiang18@umd.edu"

  def application(member)
    @member = member
    mail(
      :subject => email_subject,
      :to => receiver,
      :track_opens => "true"
    )
  end

  private

  def receiver
    case Rails.env
      when "development"
        "linchen00314@gmail.com"
      when "production"
        "csacollegepark@gmail.com, andrew.m.gu@gmail.com, linchen00314@gmail.com"
    end
  end

  def email_subject
    "New Member Registration"
  end
end
