class AddOauthAndTwitterFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :twitter_access_token, :string
    add_column :users, :twitter_access_token_secret, :string
    remove_index :users, :email
    add_index :users, :email
  end
end
