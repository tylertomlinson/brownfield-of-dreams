FactoryBot.define do
  factory :user do
    email  { Faker::Internet.email }
    first_name { Faker::Creature::Dog.name }
    last_name { Faker::Artist.name }
    password { Faker::Color.color_name }
    github_token { '856538d780ab0fcb8ebfe3b1fae0c43404ae6406' }
    role { :default }
  end

  factory :admin, parent: :user do
    role { :admin }
  end
end
