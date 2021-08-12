class UserStatistic < ApplicationRecord
  belongs_to :user

  def total_questions
    right_questions + wrong_questions
  end

  def self.set_statistics(current_user, answer)
    if !!current_user
      user_statistic = UserStatistic.find_or_create_by(user: current_user)
      answer.correct ? user_statistic.right_questions += 1 : user_statistic.wrong_questions += 1
      user_statistic.save
    end
  end
end
