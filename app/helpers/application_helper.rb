module ApplicationHelper
  def saved_comments(comments)
    comments.reject { |comment| comment.new_record? }
  end
end
