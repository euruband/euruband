FactoryGirl.define do

  factory :user do
    name { "User##{rand(1000)}" }
  end

  factory :stage do
    title { "Stage#{rand(1000)}" }
  end

  factory :message do
  end

end
