class PostsController < ApplicationController
	before_action :loged_in_user, only: [:create, :destroy]

	def create
		@post = current_user.microposts.build(post_params)
        if @post.save
          redirect_to root_url
        else
          render 'static_pages/home'
        end
	end 

	def destroy
	end 

	private 

	 def post_params
      params.require(:post).permit(:content)
    end
end
