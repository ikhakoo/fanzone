# url = "http://sports.espn.go.com/espn/rss/nba/news"
# feed = Feedjira::Feed.fetch_and_parse(url)

# feed.entries.each do |entry|
#   e = Entry.find_or_create_by(espn_id: entry.id)
#   e.published = entry.published
#   e.title = entry.title
#   e.url = entry.url
#   e.save!
# end

url = "http://www.nba.com/topvideo/rss.xml"
feed2 = Feedjira::Feed.fetch_and_parse(url)
binding.pry
feed2.videos.each do |video|
  v = Entry.find_or_create_by(url: video.id)
  v.published = video.published
  v.description = video.description
  v.title = video.title
  v.url = video.url
  v.save!
end



# def seed_users_and_microposts
#   99.times do |n|
#     name  = Faker::Name.name
#     email = "example-#{n+1}@faker-game.com"
#     password = "password"
#     slug = Faker::Internet.slug
#     User.create!(name: name,
#   	      email: email,
#   	      password:              password,
#   	      password_confirmation: password,
#   	      slug: slug
#   	     )
#     print "|"
#   end
  
#   # Microposts
#   users = User.order(:created_at).take(6)
#   50.times do
#     content = Faker::Lorem.sentence(5)
#     users.each { |user| user.tweets.create!(content: content) }
#     print "|"
#   end
  
#   # Following relationships
#   users = User.all
#   user  = users.first
#   following = users[2..50]
#   followers = users[3..40]
#   following.each { |followed| user.follow!(followed) }
#   followers.each { |follower| follower.follow!(user) }
# end

