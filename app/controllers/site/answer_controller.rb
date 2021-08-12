module Site
  class AnswerController < SiteController
    def question
      @answer = Answer.find(params[:answer_id])
      UserStatistic.set_statistics(current_user, @answer)
    end
  end
end
