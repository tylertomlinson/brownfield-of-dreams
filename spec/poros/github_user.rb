require 'rails_helper'

RSpec.describe GitHubUser do
  before :each do
    @repo = GitHubUser.new({login: 'Tyler', html_url: 'github.com'})
  end

  it 'it is a GitHubUser object' do
    expect(@repo).to be_an_instance_of(GitHubUser)
  end

  it 'has attributes ' do
    expect(@repo.login).to eq('Tyler')
    expect(@repo.html_url).to eq('github.com')
  end
end
