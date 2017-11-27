FactoryGirl.define do
  factory :toy do
    name 'Minion name'
    aasm_state 'wake_up'

    user
  end
end
