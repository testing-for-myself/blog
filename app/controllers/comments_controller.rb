class CommentsController < ApplicationController
  http_basic_authenticate_with name: "jack", password: "password", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    #render plain: params[:comment].inspect
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      #render plain: params[:comment].inspect
      redirect_to article_path(@comment.article_id)
    else
      render 'edit'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
