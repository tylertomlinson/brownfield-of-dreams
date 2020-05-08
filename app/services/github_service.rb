class GithubService
  def repos(github_token)
    response = conn(github_token).get('/user/repos')
    parse_it(response)
  end

  def followers(github_token)
    response = conn(github_token).get('user/followers')
    parse_it(response)
  end

  def following(github_token)
    response = conn(github_token).get('user/following')
    parse_it(response)
  end

  private

  def conn(github_token)
    Faraday.new(url: 'https://api.github.com') do |faraday|
      faraday.headers[:Authorization] = "token #{github_token}"
    end
  end

  def parse_it(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
