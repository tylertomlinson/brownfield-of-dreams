class User < ApplicationRecord
  has_many :user_videos, dependent: :destroy
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  enum role: { default: 0, admin: 1 }
  has_secure_password

  def user_repos(size)
    all_repos = GithubService.new.repos(github_token)
    # require "pry"; binding.pry
    all_repos.sample(size)
  end
end
