require 'rails_helper'

RSpec.describe Repo do
  before :each do
    @repo = Repo.new({name: 'Tyler', html_url: 'github.com'})
  end

  it 'it is a Repo object' do
    expect(@repo).to be_an_instance_of(Repo)
  end

  it 'has attributes ' do
    expect(@repo.name).to eq('Tyler')
    expect(@repo.html_url).to eq('github.com')
  end

end
