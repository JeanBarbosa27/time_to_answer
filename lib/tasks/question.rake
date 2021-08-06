require_relative 'shared_task_methods'

namespace :dev do
  desc 'Adds fake questions to use in answers.'
  task add_fake_questions: :environment do
    show_spinner('Creating fake questions...') do
      answers_attributes = 4.times.map do |time|
        {
          description: Faker::Lorem.sentence,
          correct: time.zero?
        }
      end

      Subject.all.each do |subject|
        rand(5..10).times do |_|
          Question.create!(
            description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
            subject: subject,
            answers_attributes: answers_attributes
          )
        end
      end
    end
  end
end
