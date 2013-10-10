module ApplicationHelper
  def avatar_url(user)
    default_url = "#{root_url}images/guest.jpg"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = 180
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
  end
end
