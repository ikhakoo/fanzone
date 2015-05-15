desc 'pullrss'

url = "http://sports.espn.go.com/espn/rss/nba/news"
feed = Feedjira::Feed.fetch_and_parse(url)

feed.entries.each do |entry|
  e = Entry.find_or_create_by(espn_id: entry.id)
  e.published = entry.published
  e.title = entry.title
  e.url = entry.url
  e.save!
end