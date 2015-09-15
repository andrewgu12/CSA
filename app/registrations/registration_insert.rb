require 'google/api_client'
require 'google_drive'

module RegistrationInsert
	def self.insert(registration)
		keyPath = Rails.root.join('config', 'UMDCSA.p12').to_s
		key = Google::APIClient::KeyUtils.load_from_pkcs12(keyPath, 'notasecret')
		auth_client = Signet::OAuth2::Client.new(
			:token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
			:audience => 'https://accounts.google.com/o/oauth2/token',
			:scope => 'https://www.googleapis.com/auth/drive ' + 'https://spreadsheets.google.com/feeds/',
			:issuer => '569408955529-u1fjr2l81sl5rqck9oa43f4heb2nsf7h@developer.gserviceaccount.com',
			:signing_key => key)
		auth_client.fetch_access_token!
		access_token = auth_client.access_token
		session = GoogleDrive.login_with_oauth(access_token)

		ws = session.spreadsheet_by_key("1eiUIpG04yPlQXuNf0cO-DBcQDQSXSAkfRgVO4NGNYsw").worksheets[0]
		size = ws.list.size+2
		ws[size,1] = registration[:firstName]
		ws[size,2] = registration[:lastName]
		ws[size,3] = registration[:email]
		ws[size,4] = registration[:year]
		ws[size,5] = registration[:shirtSize]
		if registration[:shirtSize] == "none"
			ws[size,6] = "yes"
		else
			ws[size,6] = "no"
		end
		ws.synchronize()
	end
end
