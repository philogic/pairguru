module ApplicationHelper
  def saved_comments(comments)
    comments.reject { |comment| comment.new_record? }
  end
  def no_comments?
    @comments.count == 0
  end
end
