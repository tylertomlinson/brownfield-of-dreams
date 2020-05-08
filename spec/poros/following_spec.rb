require 'rails_helper'

RSpec.describe Following do
  before :each do
    @following = Following.new({login: 'Tyler', html_url: 'github.com'})
  end

  it 'it is a Following object' do
    expect(@following).to be_an_instance_of(Following)
  end

  it 'has attributes ' do
    expect(@following.login).to eq('Tyler')
    expect(@following.html_url).to eq('github.com')
  end

end
