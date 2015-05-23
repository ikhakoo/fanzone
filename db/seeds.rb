url = "http://sports.espn.go.com/espn/rss/nba/news"
feed = Feedjira::Feed.fetch_and_parse(url)

feed.entries.each do |entry|
  e = Entry.find_or_create_by(espn_id: entry.id)
  e.published = entry.published
  e.title = entry.title
  e.url = entry.url
  e.save!
  x = ["|","/","-","+","#"]
  print x.shuffle.sample
end

puts "Finished Seeding ESPN"

url2 = "http://www.nba.com/topvideo/rss.xml"
feed2 = Feedjira::Feed.fetch_and_parse(url2)
feed2.entries.each do |entry|
  e = Entry.find_or_create_by(espn_id: entry.id)
  e.published = entry.published
  e.description = entry.summary
  e.title = entry.title
  e.url = entry.url
  e.save!
  x = ["|","/","-","+","#"]
  print x.shuffle.sample
end

puts "Finished Seeding NBA.com"

url3 = "http://sports.yahoo.com/nba/rss.xml"
feed3 = Feedjira::Feed.fetch_and_parse(url3)
feed3.entries.each do |entry|
  e = Entry.find_or_create_by(espn_id: entry.id)
  e.published = entry.published
  e.title = entry.title
  e.url = entry.url
  e.save!
  x = ["|","/","-","+","#"]
  print x.shuffle.sample
end

puts "Finished Seeding Yahoo.com"

# binding.pry
puts "yolo"

def seed_users_and_microposts
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@faker.com"
    password = "password"
    slug = Faker::Internet.slug
    avatar = Faker::Avatar.image("my-own-slug", "100x100", "jpg")
    User.create!(name: name,
  	      email: email,
  	      password:              password,
  	      password_confirmation: password,
  	      slug: slug,
          avatar: avatar
  	     )
    x = ["|","/","-","+","#"]
    print x.shuffle.sample
  end

  puts "Finished Seeding Users"
  
  # Microposts
  users = User.order(:created_at).take(6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.tweets.create!(content: content) }
    x = ["|","/","-","+","#"]
    print x.shuffle.sample
  end

  puts "Finished Seeding Microposts"
  
  # Following relationships
  users = User.all
  user  = users.first
  following = users[2..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }

  puts "Completed Seed"
end

seed_users_and_microposts

