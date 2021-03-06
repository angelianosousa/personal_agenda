class ApplicationController < ActionController::Base
  # before_action :set_time_zone, if: :user_signed_in?
  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? "#{resource_class.to_s.downcase}_devise" : "application"
  end

end
