class RegistrationMailer < ActionMailer::Base
  self.postmark_settings = {api_key: '62fe62df-c038-4107-8dd5-f877c9a1a65a'}
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
        "andrew.m.gu@gmail.com"
      when "production"
        "csacollegepark@gmail.com, andrew.m.gu@gmail.com"
    end
  end

  def email_subject
    "New Member Registration"
  end
end
