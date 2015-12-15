json.posts @posts do |post|
	json.first_name post.first_name
	json.last_name post.last_name
	json.city post.city
	json.country post.country
	json.gender post.gender
	json.date_of_birth post.date_of_birth
	json.profile_picture post.profile_picture
end