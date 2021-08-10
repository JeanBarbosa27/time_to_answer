require_relative 'shared_task_methods'

namespace :dev do
  desc 'Rests subject questions count.'
  task reset_subjects_counters: :environment do
    show_spinner('Reseting subjects counters...') do
      Subject.all.each do |subject|
        Subject.reset_counters subject.id, :questions
      end
    end
  end
end
