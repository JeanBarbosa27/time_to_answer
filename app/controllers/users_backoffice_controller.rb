class UsersBackofficeController < ApplicationController
  before_action :authenticate_user!
  before_action :build_current_user
  layout 'users_backoffice'

  private

  def build_current_user
    current_user.build_user_profile if current_user.user_profile.blank?
  end
end
