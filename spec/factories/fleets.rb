FactoryBot.define do
  factory :fleet do
    aircraft_model { create(:aircraft_model) }
    designator { Faker::Lorem.characters(number: 4) }
    cover { 'https://www.linktocover.com/cover.jpg' }
    turbulence_category { %i[A B C D].sample }
    location { create(:airport) }
    status { Fleet.statuses.to_a.sample.last }
    hub { create(:airport) }
  end
end
