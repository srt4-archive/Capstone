class VotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
	@user = current_user
	@vote = @post.votes.create!(
		:user => @user
	)
	redirect_to :back
  end
end
