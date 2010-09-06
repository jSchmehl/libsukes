# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

	USER_NAME, PASSWORD = "libsukes", "pertuis84"
	before_filter :authenticate, :set_locale

	private
	  def authenticate
	    authenticate_or_request_with_http_basic do |user_name, password|
	      user_name == USER_NAME && password == PASSWORD
	    end
	  end
	
	private
		def set_locale
			if params[:locale]
				# if params[:locale] is nil then I18n.default_locale will be used
				I18n.locale = params[:locale]
				session[:locale] = params[:locale]
			elsif session[:locale]
				I18n.locale = session[:locale]
			else
				I18n.locale = extract_locale_from_accept_language_header
				session[:locale] = params[:locale]
			end
		end
		
	private
		def extract_locale_from_accept_language_header
		  request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
		end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
