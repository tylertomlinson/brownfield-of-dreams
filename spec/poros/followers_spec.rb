require 'rails_helper'

RSpec.describe Follower do
  before :each do
    @follower = Follower.new({login: 'Tyler', html_url: 'github.com'})
  end

  it 'it is a Follower object' do
    expect(@follower).to be_an_instance_of(Follower)
  end

  it 'has attributes ' do
    expect(@follower.login).to eq('Tyler')
    expect(@follower.html_url).to eq('github.com')
  end

end
