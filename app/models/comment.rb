class Comment < ActiveRecord::Base
	belongs_to :parent
	belongs_to :user
	belongs_to :tweet
end
