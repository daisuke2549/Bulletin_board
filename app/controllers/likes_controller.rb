class LikesController < ApplicationController
   before_action :authenticate_account!

   def create
    post = Post.find(params[:post_id])
    post.likes.create!(account_id: current_account.id)
    redirect_to post_path(post)
  end
end