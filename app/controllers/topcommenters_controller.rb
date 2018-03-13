class TopcommentersController < ApplicationController
  def index
    @topcommenters = Comment.top_commenters
  end
end
