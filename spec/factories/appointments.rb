FactoryBot.define do
  factory :appointment do
    date Date.today
    time Time.current
    user
    vet
  end
end
