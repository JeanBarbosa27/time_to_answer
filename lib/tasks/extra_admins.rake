require_relative 'shared_task_methods'

namespace :dev do
  desc 'Adds extra admins to access admins backoffice'
  task add_extra_admins: :environment do
    show_spinner('Creating extra admins...') do
      10.times do
        Admin.create!(
          email: Faker::Internet.email,
          password: DEFAULT_PASSWORD,
          password_confirmation: DEFAULT_PASSWORD
        )
      end
    end
  end
end
