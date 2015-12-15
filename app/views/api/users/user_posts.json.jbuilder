json.posts @posts do |post|
	json.text post.text
	json.private post.private
end