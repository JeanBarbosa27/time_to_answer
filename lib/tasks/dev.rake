namespace :dev do

  DEFAULT_PASSWORD = 123456

  desc 'Resets setup environment with initial state.'
  task reset_setup: :environment do
    if Rails.env.development?
      show_spinner('Droping data base...') { %x(`rails db:drop`) }
      show_spinner('Creating data base from scratch...') { %x(`rails db:create`) }
      show_spinner('Migrating data base...') { %x(`rails db:migrate`) }
      show_spinner('Creating default admin...') { %x(`rails dev:add_default_admin`) }
      show_spinner('Creating default user...') { %x(`rails dev:add_default_user`) }
    else
      puts 'This command just works at development environment!'
    end
  end

  desc 'Adds default admin to access admin backoffice'
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc 'Adds default user to access user backoffice'
  task add_default_user: :environment do
    User.create!(
      email: 'user@user.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

  private

  def show_spinner(start_message, end_message = 'Successfully done!')
    spinner = TTY::Spinner.new("[:spinner] #{start_message}")
    spinner.auto_spin
    yield
    spinner.success("(#{end_message})")
  end
end
