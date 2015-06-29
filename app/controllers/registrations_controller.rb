require 'google/api_client'
require 'google_drive'

class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

 #  # GET /registrations
 #  # GET /registrations.json
  def index

	@registrations = Registration.all
	# format.html {redirect_to action: 'new'}
	# redirect_to :action =>
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  	 # @registration = Registration.friendly.find(params[:id])
  end

  # GET /registrations/new
  def new
	@registration = Registration.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
	@registration = Registration.new(registration_params)
	# RegistrationInsert.insert(registration_params)
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
		ws[size,1] = @registration[:firstName]
		ws[size,2] = @registration[:lastName]
		ws[size,3] = @registration[:email]
		ws[size,4] = @registration[:year]
		ws[size,5] = @registration[:shirtSize]
		if @registration[:shirtSize] == "none"
			ws[size,6] = "yes"
		else
			ws[size,6] = "no"
		end
		ws.synchronize()

	respond_to do |format|
	  if @registration.save
		format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
		format.json { render :show, status: :created, location: @registration }
	  else
		format.html { render :new }
		format.json { render json: @registration.errors, status: :unprocessable_entity }
	  end
	end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
	respond_to do |format|
	  if @registration.update(registration_params)
		format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
		format.json { render :show, status: :ok, location: @registration }
	  else
		format.html { render :edit }
		format.json { render json: @registration.errors, status: :unprocessable_entity }
	  end
	end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
	@registration.destroy
	respond_to do |format|
	  format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
	  format.json { head :no_content }
	end
  end

  private
	# Use callbacks to share common setup or constraints between actions.
	def set_registration
	  @registration = Registration.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def registration_params
	  params.require(:registration).permit(:firstName, :lastName, :shirtSize, :year, :email)
	end
end
