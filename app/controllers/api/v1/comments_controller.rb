class Api::V1::CommentsController < ApplicationController
  def index
    comments = Comment.where(author_id: params[:user_id])
    render json: comments, status: :ok
  end
end
