class LikesController < ApplicationController
   before_action :authenticate_account!

   def create
    post = Post.find(params[:post_id])
    post.likes.create!(account_id: current_account.id)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by!(account_id: current_account.id)
    like.destroy!
    redirect_to posts_path(post)
  end

end