class PostsController < ApplicationController
	before_action :logged_in_user, only: [:show, :create, :destroy]
	before_action :correct_user, only: :destroy

  def show 
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(page: params[:page])
  end 

  def create
     @post = current_user.posts.build(post_params)
        if @post.save
          redirect_to root_url
        else
          @feed_items = []
          render 'static_pages/home'
        end
	end 

	def destroy
    @post.destroy
    redirect_to root_url
	end 

	private 

	 def post_params
      params.require(:post).permit(:content, :picture)
    end

   
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
