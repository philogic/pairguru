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

class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates_presence_of :content
  validates_uniqueness_of :movie_id, {  on: :create, scope: :user_id, message: 'You can submit only one review per movie!' }
end
