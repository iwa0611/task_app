class PostsController < ApplicationController
   
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title,:start,:finish,:all_day,:coment))
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash[:notice] = "スケジュールを登録できませんでした"
      render "new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title,:start,:finish,:all_day,:coment))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.delete
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end

end