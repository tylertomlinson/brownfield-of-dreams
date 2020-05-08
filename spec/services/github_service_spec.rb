require 'rails_helper'

RSpec.describe 'GithubService' do
  it 'exists' do
    service = GithubService.new

    expect(service).to be_a GithubService
  end

  it 'can import data' do

    service = GithubService.new

    user_repos = service.repos(ENV['GITHUB_TOKEN'])

    expect(user_repos).to be_a Array
    expect(user_repos.sample).to have_key(:name)
    expect(user_repos.sample).to have_key(:html_url)
  end
end
