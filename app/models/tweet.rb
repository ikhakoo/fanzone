class Tweet < ActiveRecord::Base

  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  has_many :comments

  has_many :taggings
	has_many :tags, through: :taggings

	def all_tags=(names)
	  self.tags = names.split(",").map do |name|
	      Tag.where(name: name.strip).first_or_create!
	  end
	end
 
	def all_tags
  	self.tags.map(&:name).join(", ")
	end

end
