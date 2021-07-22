module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    before_action :set_admin, only: %i[edit update]
    before_action :extract_passwords, only: %i[update]
    before_action :admin_params, only: %i[update]

    def index
      @admins = Admin.all
    end

    def edit; end

    def update
      if @admin.update(admin_params)
        redirect_to admins_backoffice_admins_url, notice: I18n.t('messages.sucess.update.admin')
      else
        render :edit
      end
    end

    private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def extract_passwords
      params[:admin].extract!(:password, :password_confirmation) if empty_passwords?
    end

    def empty_passwords?
      params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
    end

    def admin_params
      params.require(:admin).permit(
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
