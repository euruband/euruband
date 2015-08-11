FactoryGirl.define do

  factory :user do
    name { "User##{rand(1000)}" }
  end

  factory :stage do
    title { "Stage#{rand(1000)}" }
    user
  end

  factory :message do
    content 'Pi is equal 3'
    user
  end

end
