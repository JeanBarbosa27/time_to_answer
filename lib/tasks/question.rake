require_relative 'shared_task_methods'

namespace :dev do
  desc 'Adds fake questions to use in answers.'
  task add_fake_questions: :environment do
    show_spinner('Creating fake questions...') do
      Subject.all.each do |subject|
        rand(5..10).times do |_|
          Question.create!(
            description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
            subject: subject
          )
        end
      end
    end
  end
end
