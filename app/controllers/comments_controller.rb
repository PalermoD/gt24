class CommentsController < ApplicationController
	before_action :logged_in_user, only:[:create, :destroy]
	#before_action :correct_user, only: :destroy
    
    def create
    	@comment = current_user.comments.build(comment_params)
		@post = Post.find(params[:post_id])
	    @comment = @post.comments.build(page: params[:page])
		@comment.user = current_user
        if @comment.save
           redirect_to :back
        else
           @feed_items = []
           redirect_to :back
        end 
	end 

	def destroy 
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.user = current_user
		@comment.destroy
		redirect_to :back
	end 

	private 

	def comment_params 
		params.require(:comment).permit(:content, :picture)
    end 

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
