FactoryBot.define do
  factory :appointment do
    date "date"
    time "time"
    user
    vet
  end
end
