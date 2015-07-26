class AdminController < ApplicationController
    before_filter :authenticate_admin!
    layout "admin_layout"

    def ao_dashboard
        get_auxiliary
    end

    def event_dashboard

    end

    def index
      @hide_menu = true
    end

    def events_view
      @events = Event.all
    end
    def event_view
      puts "Params: #{params[:id]}"
      @event = Event.find_by(event_id: params[:id])
      print "Event: #{@event.name}"
    end
    def event_new
    end
    def event_create
      @event = Event.new(event_params)
      @event.event_id = @event.name.downcase.gsub(/\s/, "_")
      @event.save
    end
    private

    def admin_params
        params.require(:admin).permit(:email, :password)
    end

    def get_auxiliary
        @auxiliaries = Auxiliary.all
    end

    def event_params
      params.require(:event).permit(:name, :date, :description)
    end
end
