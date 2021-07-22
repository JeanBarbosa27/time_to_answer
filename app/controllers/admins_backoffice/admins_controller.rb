module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    before_action :admin_params, only: %i[update]

    def index
      @admins = Admin.all
    end

    def edit
      @admin = Admin.find(params[:id])
    end

    def update
      admin = Admin.find(params[:id])

      if admin.update(admin_params)
        redirect_to admins_backoffice_admins_url, notice: I18n.t('messages.sucess.update.admin')
      else
        render :edit
      end
    end

    private

    def admin_params
      params.require(:admin).permit(
        :email,
        :password,
        :password_confirmation
      )
    end
  end
end
