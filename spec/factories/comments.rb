# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    id 1
    entry_id 1
    relationship_id 1
    text "MyString"
  end
end
