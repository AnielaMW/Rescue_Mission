require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "person#{n}"}
  end

  factory :question do
    user
    sequence(:title) { |n| "#{n}Life has two rules: 1 Never quit. 2 Always remember rule 1." }
    sequence(:description) { |n| "#{n}Nothing is impossible, the word itself says I’m possible! You only live once, but if you do it right, once is enough. That it will never come again is what makes life so sweet." }
  end

  factory :answer do
    user
    question
    sequence(:description) { |n| "#{n}If Plan A doesn't work, the alphabet has 25 more letters to try." }
  end
end
