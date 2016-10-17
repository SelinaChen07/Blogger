class CommentsController < ApplicationController
	

	def create
		@comment = Article.find(params[:article_id]).comments.new(comment_params)
		@comment.save

		redirect_to article_path(@comment.article_id)

	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		flash.notice = "Comment by '#{@comment.author_name}' is removed."
		redirect_to article_path(params[:article_id])
	end

	private
	def comment_params
  		params.require(:comment).permit(:author_name, :body)
	end

end
