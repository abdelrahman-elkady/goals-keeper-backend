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

post_1 = Post.new
post_1.text = 'i will study all day today'
post_1.goal = a_plus
post_1.user = kady
post_1.save


post_2 = Post.new
post_2.text = 'would you explain ruby to me ? please ...'
post_2.goal = a_plus
post_2.user = ali
post_2.save

post_3 = Post.new
post_3.text = 'i would like to improve my GPA this semester too'
post_3.goal = quit_smoking
post_3.user = abdo
post_3.save

comment_1 = Comment.new
comment_1.body = 'All day ? I dare you !'
comment_1.user = ali
comment_1.post = post_1
comment_1.save

like_1 = Like.new
like_1.post = post_1
like_1.user = abdo
like_1.save

f = Following.new
f.user = ali
f.follower = abdo
f.save

f2 = Following.new
f2.user = abdo
f2.follower = kady
f2.save

f3 = Following.new
f3.user = kady
f3.follower = abdo
f3.save

f4 = Following.new
f4.user = abkr
f4.follower = abdo
f4.save
