# == Schema Information
#
# Table name: characters
#
#  id         :bigint           not null, primary key
#  name       :string
#  age        :integer
#  weight     :float
#  story      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :character do
    name { Faker::Name.name }
    age { rand(18..65) }
    weight { rand(35.0..100).round(2) }
    story { Faker::Lorem.sentence(word_count: 15, supplemental: true) }
  end
end
