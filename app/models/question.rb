class Question < ApplicationRecord
  belongs_to :subject, counter_cache: true, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  after_create :increment_admin_statistic

  # Kaminari
  paginates_per 5

  scope :search_by_description, ->(term, page) {
    includes(:answers, :subject)
      .where('lower(description) LIKE ?', "%#{term.downcase}%")
      .page(page)
  }

  scope :search_by_subject, ->(subject_id, page) {
    includes(:answers, :subject)
      .where(subject_id: subject_id)
      .page(page)
  }

  scope :order_by_last_questions, ->(page) {
    includes(:answers, :subject).order('created_at desc').page(page)
  }

  private

  def increment_admin_statistic
    AdminStatistic.increment_by_event(AdminStatistic::EVENTS[:total_questions])
  end
end
