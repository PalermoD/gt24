class CommentsController < ApplicationController
	before_action :logged_in_user, only:[:create, :destroy]
	before_action :correct_user, only: :destroy

	

	def create
		@post = Post.find(params[:post_id])
	    @comment = @post.comments.build(comment_params)
		@comment.user = current_user
        if @comment.save
        	
          render 'posts/show'
        else
           @feed_items = []
           render 'posts/show'
        end 
	end 

	def destroy 
	end 

	private 

	def comment_params 
		params.require(:comment).permit(:content, :picture)
    end 

    def correct_user
      @comment = current_user.comment.find_by(id: params[:id])
      render 'post/show' if @comment.nil?
    end
end
