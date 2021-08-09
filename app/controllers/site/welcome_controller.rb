module Site
  class WelcomeController < SiteController
    def index
      @questions = Question.last_questions params[:page]
    end
  end
end
