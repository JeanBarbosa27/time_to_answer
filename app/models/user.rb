class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name,  presence: true, length: { minimum: 3 },
                                      on: :update, unless: :reset_password_token_present?

  has_one :user_profile
  accepts_nested_attributes_for :user_profile, reject_if: :all_blank

  after_create :increment_admin_statistic

  def full_name
    [first_name, last_name].join(' ')
  end

  private

  def increment_admin_statistic
    AdminStatistic.increment_by_event(AdminStatistic::EVENTS[:total_users])
  end
  
  def reset_password_token_present?
    !!$global_params[:user][:reset_password_token]
  end
end
