module UsersHelper
  
   # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  def employees_for_select
    none = User.new(:name => "Select a employee")
    [[none.name, none.id]] + User.where(:employee => true).order("name ASC").collect { |m| [m.name, m.id] }
  end
  
end
