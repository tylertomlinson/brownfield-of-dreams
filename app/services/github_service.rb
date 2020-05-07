class GithubService
  def repos(github_token)
    conn = Faraday.new(url:'https://api.github.com') do |faraday|
      faraday.headers[:Authorization] = "token #{github_token}"
    end
    response = conn.get('/user/repos')
    JSON.parse(response.body, symbolize_names: true)
  end
end
