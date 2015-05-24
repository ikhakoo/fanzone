require 'active_record'

include ActiveRecord::Tasks

namespace :pull do

  desc 'Gets RSS feed data and puts it in the database.'
  task :feedme => :environment do
    url = "http://sports.espn.go.com/espn/rss/nba/news"
    feed = Feedjira::Feed.fetch_and_parse(url)

    feed.entries.each do |entry|
      e = Entry.find_or_create_by(espn_id: entry.id)
      e.published = entry.published
      e.title = entry.title
      e.url = entry.url
      e.save!
    end

    url2 = "http://www.nba.com/topvideo/rss.xml"
    feed2 = Feedjira::Feed.fetch_and_parse(url2)

    feed2.entries.each do |entry|
      e = Entry.find_or_create_by(espn_id: entry.id)
      e.published = entry.published
      e.description = entry.summary
      e.title = entry.title
      e.url = entry.url
      e.save!
    end

    url3 = "http://sports.yahoo.com/nba/rss.xml"
    feed3 = Feedjira::Feed.fetch_and_parse(url3)
    
    feed3.entries.each do |entry|
      e = Entry.find_or_create_by(espn_id: entry.id)
      e.published = entry.published
      e.title = entry.title
      e.url = entry.url
      e.save!
    end
  end
  # url = "http://www.nba.com/topvideo/rss.xml"
  # feed = Feedjira::Feed.fetch_and_parse(url)

  # feed.videos.each do |video|
  #   v = Entry.find_or_create_by(url: video.id)
  #   v.published = video.published
  #   v.description = video.description
  #   v.title = video.title
  #   v.url = video.url
  #   v.save!
  # end
end