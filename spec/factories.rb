FactoryGirl.define do
  factory :user do
    email "test2@email.com"
    password "password"
    password_confirmation "password"
  end
  
  sequence :number do |n|
    n
  end
  
  factory :room do
    number { generate(:number) }
    bed_count { [1,2].sample(1)[0] }
  end
end