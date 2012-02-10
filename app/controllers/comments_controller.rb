class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
	@user = current_user
	@comment = @post.comments.create!(
		:body => params[:comment][:body],
		:user => @user
	)
	redirect_to @post
  end
end
