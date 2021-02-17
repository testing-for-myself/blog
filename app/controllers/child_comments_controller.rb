class ChildCommentsController < ApplicationController
    def create
        #@article = Artice.find(params[:article_id])
        @comment = Comment.find(params[:comment_id])
        @childComment = @comment.child_comments.create(child_comment_params)
        render plain: params[:child_comment].inspect
        #redirect_to article_path(@article)
    end

    private
    def child_comment_params
        params.require(:child_comment).permit(:commenter, :body)
    end
end
