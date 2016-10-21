class MailchimpMailer < ActionMailer::Base
  #self.mailchimp_setting = {api_key: ENV["MAILCHIMP_API_KEY"]}
  #mailchimp = Mailchimp::API.new(8c7f966f57f9c83b0bb2fdab9fc8f947-us14)
  #default from: "linchen00314@gmail.com"

  def add_mailchimp_subscriber
    client = Mailchimp::API.new('MAILCHIMP_API_KEY')
    client.lists.subscribe('MAILCHIMP_LIST_KEY', {email: email}, {firstName: => first_name, lastName: => last_name})
    #default from: "linchen00314@gmail.com"
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
