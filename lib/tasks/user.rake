require_relative 'shared_task_methods'

namespace :dev do
  desc 'Adds default user to access user backoffice'
  task add_default_user: :environment do
    show_spinner('Creating default user...') do
      User.create!(
        email: 'user@user.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end
end
