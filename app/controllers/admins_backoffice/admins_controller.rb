module AdminsBackoffice
  class AdminsController < AdminsBackofficeController
    before_action :set_admin, only: %i[edit update destroy]
    before_action :extract_passwords, only: %i[update]
    before_action :admin_params, only: %i[update]

    def index
      @admins = Admin.all.page params[:page]
    end

    def new
      @admin = Admin.new
    end

    def create
      @admin = Admin.new(admin_params)

      if @admin.save
        redirect_to admins_backoffice_admins_url, notice: "#{@admin.email} #{I18n.t('messages.success.create')}"
      else
        render :edit
      end
    end

    def edit; end

    def update
      if @admin.update(admin_params)
        redirect_to admins_backoffice_admins_url, notice: "#{@admin.email} #{I18n.t('messages.success.update')}"
      else
        render :edit
      end
    end

    def destroy
      if @admin.destroy
        redirect_to admins_backoffice_admins_url, notice: "#{@admin.email} #{I18n.t('messages.success.delete')}"
      else
        render :index
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
