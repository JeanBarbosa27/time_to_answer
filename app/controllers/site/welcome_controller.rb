module Site
  class WelcomeController < SiteController
    def index
      @questions = Question.order_by_last_questions params[:page]
    end
  end
end
