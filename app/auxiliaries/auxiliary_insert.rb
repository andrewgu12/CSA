require 'google/api_client'
require 'google_drive'

module AuxiliaryInsert
	def self.insert(auxiliary)
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

		ws = session.spreadsheet_by_key("1axfRK-ajkBRMs4SLu8Qbtg8vrarEiq-waDhBSIH3A-4").worksheets[0]
		size = ws.list.size+2
		ws[size, 1] = auxiliary[:name]
		ws[size, 2] = auxiliary[:email]
		ws[size, 3] = auxiliary[:major]
		ws[size, 4] = auxiliary[:expected_graduation]
		ws.synchronize()
	end
end
