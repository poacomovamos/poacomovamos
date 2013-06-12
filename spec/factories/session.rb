require 'factory_girl'

FactoryGirl.define do
  factory :session do
    date DateTime.new(2013, 5, 27)
    type 'O'
    number 42
  end
end
