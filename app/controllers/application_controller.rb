class ApplicationController < ActionController::Base

    private 

    def authorize_admin!
        unless current_user&.admin?
          redirect_to "/", alert: t(".Not_authorized")
        end
      end
end
