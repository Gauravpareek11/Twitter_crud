class PostsController < ApplicationController
  before_action :authorize
  def new
    @post = Post.new

  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path, flash: {success: 'Posts succesfully created'}
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path flash: {success: "post updated succesfully"}
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path flash: {success: "post deleted succesfully"}
    else  
      redirect_to root_path flash: {error: "unable to process your request"}
    end
  end

  private

  def post_params
    params.require(:post).permit(:text,images: [])
  end
end
