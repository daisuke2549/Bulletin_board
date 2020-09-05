class PostsController < ApplicationController
    
    def index
       @posts = Post.all
    end

    def show 
      @post = Post.find(params[:id])
    end
    
    def edit 
      @post= Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save!
            redirect_to posts_path(@post), notice: '保存できました'
          else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end

    def update
      @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to post_path(@post), notice: '更新できました'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
    end


    private
    def post_params
      params.require(:post).permit(:name, :content)
    end
    def set_post
        @post = Post.find(params[:id])
    end
end

