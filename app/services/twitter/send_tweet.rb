class Twitter::SendTweet

  include Virtus.model

  attribute :review
  attribute :url, String

  def call
    begin
      client.update tweet_body
    rescue => e
      # Send Email to Admin
    end
  end

  private

  def tweet_body
    "I just reviewed: #{review.eatery.name} | #{url}"
  end

  def client
    client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = user.twitter_access_token
      config.access_token_secret = user.twitter_access_token_secret
    end
  end

  def user
    @user ||= @review.user
  end

end