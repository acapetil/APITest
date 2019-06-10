class CommentController < ApplicationController
  def create
    message = {info: 'Mensaje creado exitosamente'}
    comment = Comment.create(comment_params)
    unless comment.valid?
      message[:info] = comment.errors[:feature_id].first
    end
    render json: message
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text, :feature_id)
  end
end
