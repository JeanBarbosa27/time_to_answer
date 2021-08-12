class ApplicationController < ActionController::Base
  before_action :set_global_params
  before_action :restrict_pagination

  layout :layout_by_resource

  private

  def layout_by_resource
    devise_layout = "#{resource_class.to_s.downcase}_devise"
    devise_controller? ? devise_layout : 'application'
  end

  def restrict_pagination
    params.extract!(:page) unless user_signed_in? || admin_signed_in?
  end

  def set_global_params
    $global_params = params
  end
end
