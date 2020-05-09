class User < ApplicationRecord
  has_many :user_videos, dependent: :destroy
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  # validates :password, presence: true
  validates :first_name, presence: true
  enum role: { default: 0, admin: 1 }
  has_secure_password

  def user_repos(size)
    all_repos = GithubService.new.repos(github_token).map do |info|
      Repo.new(info)
    end
    all_repos.sample(size)
  end

  def followers
    GithubService.new.followers(github_token).map do |info|
      GitHubUser.new(info)
    end
  end

  def following
    GithubService.new.following(github_token).map do |info|
      GitHubUser.new(info)
    end
  end

  def github_user?
    github_token != nil
  end

  def link_github_account(info)
    self.update!(github_token: info[:credentials][:token])
  end
end
