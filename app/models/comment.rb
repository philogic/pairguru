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
  before_create :has_comment?
  belongs_to :movie
  belongs_to :user, inverse_of: :comments

  validates_presence_of :content
  validates :movie_id, uniqueness:  { scope: :user_id, message: 'You can write only one comment per movie!' }

  def has_comment?
    return if Comment.exists?(user_id: user_id, movie_id: movie_id)
  end
end
