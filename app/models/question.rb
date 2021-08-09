class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  # Kaminari
  paginates_per 5

  scope :search_by_description, ->(term, page) {
    includes(:answers)
      .where('lower(description) LIKE ?', "%#{term.downcase}%")
      .page(page)
  }

  scope :order_by_last_questions, ->(page) {
    includes(:answers).order('created_at desc').page(page)
  }
end
