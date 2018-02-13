class CommentsController < ApplicationController

  before_action :set_movie

  def create
    @comment = @movie.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created"
    else
      flash.now[:alert] = "Comment has not been created"
    end
    redirect_to movie_path(@movie)
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
