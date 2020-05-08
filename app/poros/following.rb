class Following
  attr_reader :login, :html_url

  def initialize(info)
    @login = info[:login]
    @html_url = info[:html_url]
  end
end
