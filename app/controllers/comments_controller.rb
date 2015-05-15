class CommentsController < ApplicationController

	def index
	  @commentable = find_commentable
	  @comments = @commentable.comments
	end

	def create
	  @comment = Comment.new(comment_params)
	  @comment.user_id = current_user.id
	  if @comment.save
	    flash[:notice] = "Successfully saved comment."
	    redirect_to entries_path
	  else
	    render :action => 'new'
	  end
	end

private
def comment_params
  params.require(:comment).permit(:content, :commentable_id, :commentable_type)
end
end
