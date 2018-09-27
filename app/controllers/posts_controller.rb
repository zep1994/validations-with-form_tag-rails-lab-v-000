class PostsController < ApplicationController
  before_action :find!, only: [:show, :edit, :update]
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post.id)
    else 
      render :edit
    end
  end

  def find!
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
