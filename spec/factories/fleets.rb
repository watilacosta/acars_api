FactoryBot.define do
  factory :fleet do
    aircraft_model { nil }
    designator { "MyString" }
    cover { "MyString" }
    turbulence_category { "MyString" }
    location { nil }
    status { 1 }
    hub { nil }
  end
end
