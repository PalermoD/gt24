class PostsController < ApplicationController
	before_action :loged_in_user, only: [:create, :destroy]

	def create
	end 

	def destroy
	end 
end
