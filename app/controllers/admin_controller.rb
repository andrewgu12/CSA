class AdminController < ApplicationController
    layout "admin_layout"
    def index
        @hide_menu = false
    end

    def login
    end

    private
    def admin_params
        params.require(:admin).permit(:email, :password)
    end
end
