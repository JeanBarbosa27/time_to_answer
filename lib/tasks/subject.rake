require_relative 'shared_task_methods'

FILE_PATH = File.join(Rails.root, 'lib', 'tmp')

namespace :dev do
  desc 'Adds default subject to use in questions.'
  task add_default_subjects: :environment do
    file_path = File.join(FILE_PATH, 'subjects.txt')

    show_spinner('Creating default subjects...') do
      File.open(file_path, 'r').each do |line|
        Subject.create!(description: line.strip)
      end
    end
  end
end
