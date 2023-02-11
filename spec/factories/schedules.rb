FactoryBot.define do
  factory :schedule do
    start_time {Faker::Date.forward(days: 31)}
    title {Faker::Lorem.sentence}
    place {Faker::Lorem.sentence}
    person {Faker::Name.last_name}
    practice {Faker::Lorem.sentence}
    others {Faker::Lorem.sentence}

    association :user
  end
end
