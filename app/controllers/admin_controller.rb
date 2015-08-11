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
    def pictures_add

    end
    def events_view
      @events = Event.all
    end
    def event_view
      @event = Event.find_by(event_id: params[:id])
      @pictures = Picture.find_by(event_id: @event.id)
    end
    def event_new
    end
    def event_create
      @event = Event.new(event_params)
      @event.event_id = @event.name.downcase.gsub(/\s/, "_")
      @event.save
    end

    def event_edit
      @event = Event.find_by(event_id: params[:id])
    end

    def event_update
      @event = Event.find_by(event_id: params[:id])
      @event.update_attributes(event_params)
      @event.event_id = @event.name.downcase.gsub(/\s/, "_")
      @event.save
    end

    def event_delete
      @event = Event.find_by(event_id: params[:id])
      @event.destroy
    end

    def pictures_new
      @events = Event.all
    end
    def pictures_create
      @picture = Picture.new(picture_params)
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
    def picture_params
      params.require(:picture).permit(:event_id, :year, :link)
    end
end
