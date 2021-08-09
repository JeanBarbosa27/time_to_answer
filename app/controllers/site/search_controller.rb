module Site
  class SearchController < SiteController
    def questions
      @questions = Question.includes(:answers).page(params[:page])
    end
  end
end
