class ApplicationController < ActionController::Base
  protect_from_forgery

  def flash_to_headers
    if request.xhr?
      #avoiding XSS injections via flash
      flash_json = Hash[flash.map{|k,v| [k,ERB::Util.h(v)] }].to_json
      response.headers['X-Flash-Messages'] = flash_json
      flash.discard
    end
  end

  helper_method :current_user

  def require_user
    if current_user.blank?
      redirect_to root_path, :notice => "You must log in"
    end
  end

  def require_admin
    if current_user.blank? || current_user.admin? == false
      flash[:errors] = "You are not authorized. This incident will be reported."
      redirect_to root_path
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    unless request.ip == '69.54.59.151' || Rails.env == 'development'
      authenticate_or_request_with_http_basic do |username, password|
        username == "boondock" && password == "3635Walker"
      end
    end
  end
end
