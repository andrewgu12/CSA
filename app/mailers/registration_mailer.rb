class RegistrationMailer < ActionMailer::Base
	self.postmark_settings = { api_key: ENV["POSTMARK_API_KEY"]}
	default from:"mjiang18@umd.edu"

	def application(register)
		@member = register
		mail(
			:subject => email_subject
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
				"csacollegepark@gmail.com"
		end
	end

	def email_subject
		"New Member"
	end
end
