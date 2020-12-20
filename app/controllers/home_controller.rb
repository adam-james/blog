class HomeController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def show
    # TODO use date?
    # Mongoid throws not found if passed as is.
    @post = Post.find_by(id: params[:id])
  end
end
