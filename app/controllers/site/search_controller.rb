module Site
  class SearchController < SiteController
    def questions
      @questions = Question.search_by_description params[:term], params[:page]
    end

    def subject
      @questions = Question.search_by_subject params[:subject_id], params[:page]
    end
  end
end
