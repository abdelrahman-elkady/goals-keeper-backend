json.users @users do |user|
	json.first_name user.first_name
	json.last_name user.last_name
	json.city user.city
	json.country user.country
	json.gender user.gender
	json.date_of_birth user.date_of_birth
	json.profile_picture user.profile_picture
end