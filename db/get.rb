require "json"
require "open-uri"
require "curb"
require "nokogiri"
require "pry"

#URL = "http://cdn.espn.go.com/core/nba/story/_/id/12796031/kevin-durant-lauds-oklahoma-city-thunder-billy-donovan-hire?render=true&partial=article&xhr=1&device=desktop"
URL = "http://espn.go.com/nba/story/_/id/12872739/new-orleans-pelicans-fire-head-coach-monty-williams"

article = "http://cdn.espn.go.com/core/nba/playoffs/2015/story/_/id/12875718/houston-rockets-move-josh-smith-starting-lineup-game-5-los-angeles-clippers"
article2 = "http://espn.go.com/blog/cleveland-cavaliers/post/_/id/879/this-is-why-lebron-is-worth-all-of-it"

def get_page_json(article)
	json = JSON.parse(`curl '#{article}?render=true&partial=article&xhr=1&device=desktop' \
	-H 'Origin: http://espn.go.com' \
	-H 'Accept-Encoding: gzip, deflate, sdch' \
	-H 'Accept-Language: en-GB,en-US;q=0.8,en;q=0.6' \
	-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36' \
	-H 'Accept: */*' \
	-H 'Connection: keep-alive' \
	-H 'Cache-Control: max-age=0' --compressed`) 
	OpenStruct.new(json)
end



#resp = Curl::Easy.perform(URL) do |curl| 
#  curl.headers["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36" 
#  curl.verbose = true
#end

#json = JSON.parse(resp.body)

binding.pry

puts "yolo"
