module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    # gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = 'https://cdn2.iconfinder.com/data/icons/male-users-2/512/male_avatar20-64.png'
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
