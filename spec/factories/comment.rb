# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  movie_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'faker'

FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.sentence(3, true) }
    movie
    user
  end
end
