class Comment < ActiveRecord::Base
	acts_as_tree
	belongs_to :user
	belongs_to :tweet
	belongs_to :video
end
