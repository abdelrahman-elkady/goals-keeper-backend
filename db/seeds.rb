user_1 = User.create(first_name: 'someone1',last_name: 'his father 1',city: 'city',country: 'country',gender: true,date_of_birth: DateTime.now,profile_picture: '#')
user_2 = User.create(first_name: 'someone2',last_name: 'his father 2',city: 'city',country: 'country',gender: true,date_of_birth: DateTime.now,profile_picture: '#')

goal_1 = Goal.create(title: 'I need to ..',description: 'To do ..')
goal_2 = Goal.create(title: 'I need to Banana ..',description: 'Para tu ..')

user_1.goals << goal_1
user_1.save

user_2.goals << goal_1
user_2.goals << goal_2
user_2.save

post_1 = GoalPost.new
post_1.text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore .'
post_1.goal = goal_1
post_1.creator = user_1
post_1.save

post_2 = ProfilePost.new
post_2.text = 'Helo Men )) Ruski ?'
post_2.creator = user_2
post_2.profile = user_1
post_2.save

post_3 = GoalPost.new
post_3.text = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore .'
post_3.creator = user_2
post_3.save

f = Following.new
f.user = user_1
f.follower = user_2
f.save
#user_2 is folloing user_1
