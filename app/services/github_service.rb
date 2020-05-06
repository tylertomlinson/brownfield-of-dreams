class GithubService
  def fake_request
    json = get_json("/users/Shock253/repos")
    require 'pry'; binding.pry
  end

  private

  def get_json(url, params, user_api_key)
    response = conn(user_api_key).get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(user_api_key)
    Faraday.new(url: 'https://api.github.com') do |f|
      f.adapter Faraday.default_adapter
      f.params[:key] = user_api_key
    end
  end
end
