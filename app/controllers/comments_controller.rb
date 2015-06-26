class CommentsController < ApplicationController
	before_action :logged_in_user, only:[:create, :destroy]
	#before_action :correct_user, only: :destroy
    def new 
    	@comment = Comment.new
    end 

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
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.user = current_user
		@comment.destroy
		render 'posts/show'
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
