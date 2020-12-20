class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    locale = params[:locale] || cookies[:locale]
    locale = I18n.default_locale unless I18n.available_locales.include?(locale&.to_sym)
    expiry = Time.now + 30.days
    cookies[:locale] = { value: locale, expires: expiry, same_site: :lax }
    I18n.locale = locale
  end
end
