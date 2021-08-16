module AdminsBackoffice
  class SubjectsController < AdminsBackofficeController
    before_action :set_subject, only: %i[edit update destroy]

    def index
      respond_to do |format|
        format.html { @subjects = Subject.order(:description).page params[:page] }
        format.pdf { @subjects = Subject.order(:description) }
        format.json { @subjects = Subject.order(:description) }
      end
    end

    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.new(subject_params)

      if @subject.save
        redirect_to admins_backoffice_subjects_url,
                    notice: I18n.t('messages.success.create', item: @subject.description)
      else
        render :edit
      end
    end

    def edit; end

    def update
      if @subject.update(subject_params)
        redirect_to admins_backoffice_subjects_url,
                    notice: I18n.t('messages.success.update', item: @subject.description)
      else
        render :edit
      end
    end

    def destroy
      if @subject.destroy
        redirect_to admins_backoffice_subjects_url,
                    notice: I18n.t('messages.success.delete', item: @subject.description)
      else
        render :index
      end
    end

    private

    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:description)
    end
  end
end
