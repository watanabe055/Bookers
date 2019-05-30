class PostsController < ApplicationController
  def show
    @posts = Post.all
  end

  def create
    @post = Post.new(permit_params)
    @post.save!
    redirect_to action: 'show'
  end

  private
    def permit_params
      params.require(:post).permit(:name, :image)
    end
end
