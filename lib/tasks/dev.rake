require_relative 'shared_task_methods'

namespace :dev do
  desc 'Resets setup environment with initial state.'
  task reset_setup: :environment do
    if Rails.env.development?
      show_spinner('Droping data base...') { %x(`rails db:drop`) }
      show_spinner('Creating data base from scratch...') { %x(`rails db:create`) }
      show_spinner('Migrating data base...') { %x(`rails db:migrate`) }
      %x(`rails dev:add_default_admin`)
      %x(`rails dev:add_extra_admins`)
      %x(`rails dev:add_default_user`)
      %x(`rails dev:add_default_subjects`)
      %x(`rails dev:add_fake_questions`)
    else
      puts 'This command just works at development environment!'
    end
  end
end
