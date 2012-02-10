class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :votes
	
	def num_comments
		@count = self.comments.count
		
		if @count != 1 
			return @count.to_s + " comments"
		end
		return @count.to_s + " comment" 
	end
	
	
	def ajax_form
		return render :partial => "message_form"
	end

end
