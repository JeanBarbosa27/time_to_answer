module UsersBackoffice::ProfileHelper
  def select_gender(user, gender)
    user.user_profile.gender == gender ? 'btn-primary' : 'btn-secondary'
  end

  def locale_birthdate
    @user.user_profile.birthdate ? I18n.l(@user.user_profile.birthdate) : ''
  end
end
