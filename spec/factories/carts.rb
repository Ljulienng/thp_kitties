FactoryBot.define do
  factory :cart do
    user { nil }
    product { nil }
    purchased { false }
  end
end
