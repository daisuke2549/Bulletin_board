class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :authenticate_account!, only: [:new, :create, :edit, :update, :destroy]
    
  def index
     @posts = Post.all
  end

  def show 
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
  
  def edit 
    @post = current_account.posts.find(params[:id])
  end

  def new
    @post = current_account.posts.build
  end

  def create
      @post = current_account.posts.build(post_params)
      if @post.save!
          redirect_to posts_path(@post), notice: '保存できました'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
      end
  end

  def update
    @post = current_account.posts.find(params[:id])
    @post.update params.require(:post).permit(:name, :content, :image)
    if @post.update(post_params)
      redirect_to post_path(@post), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end
  
  def destroy
      @post =  current_account.posts.find(params[:id])
      @post.destroy!
      redirect_to posts_path(@post), notice: '削除に成功しました'
  end


  private
  def post_params
      params.require(:post).permit(:name, :content, :image)
  end
  def set_post
      @post = Post.find(params[:id])
  end
end