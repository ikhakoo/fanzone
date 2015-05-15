class CommentsController < ApplicationController

	def index
	  @commentable = find_commentable
	  @comments = @commentable.comments
	end

	def create
	  @commentable = find_commentable
	  @comment = @commentable.comments.build(params[:comment])
	  @comment.user_id = current_user.id
	  if @comment.save
	    flash[:notice] = "Successfully saved comment."
	    redirect_to :id => nil
	  else
	    render :action => 'new'
	  end
	end
	
	def find_commentable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/
	      return $1.classify.constantize.find(value)
	    end
	  end
	  nil
	end

end
