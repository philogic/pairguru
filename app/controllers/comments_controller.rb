class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_movie

  def create
    @comment = @movie.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created"
    else
      flash[:alert] = "Sorry, you can't add this comment: #{@comment.errors.full_messages.to_sentence}"
    end
    redirect_to movie_path(@movie)
  end

  def destroy
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
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
