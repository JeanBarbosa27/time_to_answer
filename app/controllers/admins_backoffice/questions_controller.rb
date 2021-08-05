module AdminsBackoffice
  class QuestionsController < AdminsBackofficeController
    before_action :set_question, only: %i[edit update destroy]
    before_action :set_subjects, only: %i[new edit]

    def index
      @questions = Question.includes(:subject).order(:description).page params[:page]
    end

    def new
      @question = Question.new
    end

    def create
      @question = Question.new(question_params)

      if @question.save
        redirect_to admins_backoffice_questions_url,
                    notice: I18n.t('messages.success.create', item: @question.description)
      else
        render :edit
      end
    end

    def edit; end

    def update
      if @question.update(question_params)
        redirect_to admins_backoffice_questions_url,
                    notice: I18n.t('messages.success.update', item: @question.description)
      else
        render :edit
      end
    end

    def destroy
      if @question.destroy
        redirect_to admins_backoffice_questions_url,
                    notice: I18n.t('messages.success.delete', item: @question.description)
      else
        render :index
      end
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:description, :subject_id)
    end

    def set_subjects
      @subjects = Subject.all
    end
  end
end
