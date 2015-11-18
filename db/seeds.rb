ali = User.create(first_name: 'ali',last_name: 'hassan',city: 'helwan',country: 'egypt',gender: true,date_of_birth: DateTime.now,profile_picture: '#')
kady = User.create(first_name: 'abdelrahman',last_name: 'kady',city: 'maadi',country: 'egypt',gender: true,date_of_birth: DateTime.now,profile_picture: '#')
abkr = User.create(first_name: 'mohammed',last_name: 'mostafa',city: 'maadi',country: 'egypt',gender: true,date_of_birth: DateTime.now,profile_picture: '#')
abdo = User.create(first_name: 'abdelrahman',last_name: 'mahmoud',city: 'haram',country: 'egypt',gender: true,date_of_birth: DateTime.now,profile_picture: '#')

a_plus = Goal.create(title: 'I need to get A+ in all subjects',description: 'because i want to be a rank')
quit_smoking = Goal.create(title: 'I need to stop smoking',description: 'because ciggarittes are expensive')


ali.goals << a_plus
ali.save

kady.goals << a_plus
kady.goals << quit_smoking
kady.save

post_1 = GoalPost.new
post_1.text = 'i will study all day today'
post_1.goal = a_plus
post_1.creator = kady
post_1.save


post_2 = ProfilePost.new
post_2.text = 'would you explain ruby to me ? please ...'
post_2.creator = ali
post_2.profile = kady
post_2.save

post_3 = GoalPost.new
post_3.text = 'i would like to improve my GPA this semester too'
post_3.creator = abdo
post_3.goal = quit_smoking
post_3.save


f = Following.new
f.user = ali
f.follower = abdo
f.save

f2 = Following.new
f2.user = abdo
f2.follower = kady
f2.save
