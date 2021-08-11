module UsersBackoffice::ProfileHelper
  def select_gender(user, gender)
    user.user_profile.gender == gender ? 'btn-primary' : 'btn-secondary'   
  end
end
