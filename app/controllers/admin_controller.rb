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

    def login
    end

    def add_events

    end

    def view_events
    end

    def view_event
    end

    def edit_event
    end

    def save_edited_event
    end

    private
    
    def admin_params
        params.require(:admin).permit(:email, :password)
    end

    def get_auxiliary
        @auxiliaries = Auxiliary.all
    end

end
