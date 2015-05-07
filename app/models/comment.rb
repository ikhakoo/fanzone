class Comment < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :parent
  belongs_to :user
  attr_accessible :content, :user_id, :tweet_id
end
