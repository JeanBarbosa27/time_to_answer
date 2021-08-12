class UserStatistic < ApplicationRecord
  belongs_to :user

  def total_questions
    right_questions + wrong_questions
  end
end
