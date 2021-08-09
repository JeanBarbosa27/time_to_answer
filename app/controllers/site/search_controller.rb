module Site
  class SearchController < SiteController
    def questions
      @questions = Question.search params[:term], params[:page]
    end
  end
end
