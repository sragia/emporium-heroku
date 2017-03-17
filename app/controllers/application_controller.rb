class ApplicationController < ActionController::Base
  before_filter :set_locale
  helper :all # include all helpers, all the time
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
  private
  def initialize_cart
    if session[:cart_id] and Cart.exists?(session[:cart_id])
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
  def set_locale
    accept_lang = request.env['HTTP_ACCEPT_LANGUAGE']
    accept_lang = accept_lang.blank? ? nil : accept_lang[/[\A,;]+/]
    locale = params[:locale] || session[:locale] || accept_lang ||
      DEFAULT_LOCALE
    begin
      I18n.locale = locale
      session[:locale] = locale
    rescue
      I18n.locale = :lv
    end
  end
end
