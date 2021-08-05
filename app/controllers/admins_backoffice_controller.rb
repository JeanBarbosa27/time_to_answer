class AdminsBackofficeController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin_human_names, only: %i[index new edit]
  before_action :set_question_human_names, only: %i[index new edit]
  before_action :set_subject_human_names, only: %i[index new edit]
  layout 'admins_backoffice'

  private

  def set_admin_human_names
    @admin_model_name = Admin.model_name.human count: Admin.all
    @admin_attribute_email = Admin.human_attribute_name 'email'
    @admin_attribute_password = Admin.human_attribute_name 'password'
    @admin_attribute_password_confirmation = Admin.human_attribute_name 'password_confirmation'
  end

  def set_question_human_names
    @question_model_name = Question.model_name.human count: Question.all
    @question_attribute_subject = Question.human_attribute_name 'subject'
    @question_attribute_description = Question.human_attribute_name 'description'
  end

  def set_subject_human_names
    @subject_model_name = Subject.model_name.human count: Subject.all
    @subject_attribute_description = Subject.human_attribute_name 'description'
  end
end
