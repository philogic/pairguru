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
  before_save :has_comment?
  belongs_to :movie
  belongs_to :user, counter_cache: true


  validates_presence_of :content
  validates :movie_id, uniqueness:  { scope: :user_id, message: 'You can submit only one comment per movie!' }

  def has_comment?
    return if Comment.exists?(user_id: user_id, movie_id: movie_id)
  end

  def self.top_commenters
    # top ten commenters who have at least one comment
    User.joins(:comments)
        .where('comments.created_at >= ?', 1.week.ago.utc)
        .select('users.name, COUNT(comments.id) AS comments_count')
        .group('users.id')
        .order('comments_count desc')
        .limit(10)
  end
end
