module Site
  class SearchController < SiteController
    def questions
      @questions = Question.search_by_description params[:term], params[:page]
    end
  end
end
