
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer
  # example for 3rd party:
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end

