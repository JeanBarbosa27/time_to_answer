require_relative 'shared_task_methods'

namespace :dev do
  desc 'Adds default admin to access admins backoffice'
  task add_default_admin: :environment do
    show_spinner('Creating default admin...') do
      Admin.create!(
        email: 'admin@admin.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
      )
    end
  end
end
