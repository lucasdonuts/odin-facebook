# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clearing database and restarting id sequence before seeding
ActiveRecord::Base.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
ActiveRecord::Base.connection.execute('ALTER SEQUENCE friend_requests_id_seq RESTART WITH 1')
ActiveRecord::Base.connection.execute('ALTER SEQUENCE friendships_id_seq RESTART WITH 1')
ActiveRecord::Base.connection.execute('ALTER SEQUENCE comments_id_seq RESTART WITH 1')
ActiveRecord::Base.connection.execute('ALTER SEQUENCE likes_id_seq RESTART WITH 1')
ActiveRecord::Base.connection.execute('ALTER SEQUENCE notifications_id_seq RESTART WITH 1')
ActiveRecord::Base.connection.execute('ALTER SEQUENCE posts_id_seq RESTART WITH 1')

User.destroy_all

# Seeding users
# User.create(first_name: 'Chad',
#             last_name: 'McChadson',
#             email: 'anotherchad@lotsofchads.com',
#             password: 'password')
# User.create(first_name: 'Linda',
#             last_name: 'McLindason',
#             email: 'anotherLinda@lotsofLindas.com',
#             password: 'password')
# User.create(first_name: 'Donald',
#             last_name: 'McDonaldson',
#             email: 'anotherDonald@lotsofDonalds.com',
#             password: 'password')
# User.create(first_name: 'Kelly',
#             last_name: 'McKellyson',
#             email: 'anotherKelly@lotsofKellys.com',
#             password: 'password')
# User.create(first_name: 'Lucas',
#             last_name: 'McLucasson',
#             email: 'anotherLucas@lotsofLucass.com',
#             password: 'password')
# User.create(first_name: 'Michelle',
#             last_name: 'McMichelleson',
#             email: 'anotherMichelle@lotsofMichelles.com',
#             password: 'password')
# User.create(first_name: 'Paul',
#             last_name: 'McPaulson',
#             email: 'anotherPaul@lotsofPauls.com',
#             password: 'password')
# User.create(first_name: 'Jean',
#             last_name: 'McJeanson',
#             email: 'anotherJean@lotsofJeans.com',
#             password: 'password')
# User.create(first_name: 'Kayla',
#             last_name: 'McKaylason',
#             email: 'anotherKayla@lotsofKaylas.com',
#             password: 'password')
# User.create(first_name: 'Chase',
#             last_name: 'McChaseson',
#             email: 'anotherChase@lotsofChases.com',
#             password: 'password')

20.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.safe_email(name: :first_name),
              password: 'password')
end

# Seeding posts
User.all.each do |user|
  rand(1..10).times do
    user.posts.create(
      body: Faker::TvShows::Community.quotes,
      created_at: Faker::Time.backward(days: 30)
    )
  end
end

# Seeding friends
User.all.each do |user1|
  i = rand(2..10)
  friends = User.all.shuffle.reject { |user2| user1.friends.include?(user2) || user1 == user2 }.first(i)
  friends.each do |friend|
    Friendship.create!(friend_a_id: user1.id, friend_b_id: friend.id)
  end
end

# Seeding post likes
Post.all.each do |post|
  likers = []
  rand(0..20).times do
    user = User.all.sample

    post.likes.create(user_id: user.id, likeable: post) unless likers.include?(user.id)
    likers << user.id
  end
end

# Seeding post comments
Post.all.each do |post|
  commenters = []
  rand(0..10).times do
    user = User.all.sample

    post.comments.create(user_id: user.id,
                         body: Faker::Hipster.sentence) unless commenters.include?(user.id)
    
    commenters << user.id
  end
end