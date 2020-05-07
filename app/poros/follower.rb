class Follower
  attr_reader :user_name, :html_url

  def initialize(info)
    @user_name = info[:login]
    @html_url = info[:html_url]
  end
end
