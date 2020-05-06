class AddGithubApiKeysToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :github_api_key, :string
  end
end
