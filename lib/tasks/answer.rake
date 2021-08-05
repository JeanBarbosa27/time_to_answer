require_relative 'shared_task_methods'

namespace :dev do
  desc 'Adds fake answers.'
  task add_fake_answers: :environment do
    show_spinner('Creating fake answers...') do
      Question.all.each do |question|
        4.times do |time|
          Question.create!(
            question: question,
            description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
            correct: time.zero?
          )
        end
      end
    end
  end
end
