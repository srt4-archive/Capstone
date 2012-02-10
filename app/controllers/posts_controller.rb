class PostsController < ApplicationController
	def index
		@posts = Post.all(:order => "created_at DESC")
		#@posts = current_user.posts.all
		respond_to do |format|
			format.html
		end
	end

	def show
		@user = current_user
		@post = Post.find(params[:id])
	end

	def create
		@user = current_user
		@post = Post.create(
			:message => params[:message],
			:route => params[:route],
			:user => @user
		)
		respond_to do |format|
			if @post.save
				format.html { redirect_to posts_path }
				format.js
			else
				flash[:notice] = "Message failed to save"
				format.html { redirect_to posts_path }
			end
		end
	end
end
