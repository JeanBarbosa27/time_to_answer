class AdminsBackofficeController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin_model_name, only: %i[index new edit]
  before_action :set_question_model_name, only: %i[index new edit]
  before_action :set_subject_model_name, only: %i[index new edit]
  layout 'admins_backoffice'

  private

  def set_admin_model_name
    @admin_model_name = Admin.model_name.human count: Admin.all
  end

  def set_question_model_name
    @question_model_name = Question.model_name.human count: Question.all
  end

  def set_subject_model_name
    @subject_model_name = Subject.model_name.human count: Subject.all
  end
end
