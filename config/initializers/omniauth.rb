
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer
  # example for 3rd party:
  provider :cas, :host => 'cas.yourdomain.com'
  # look here for more info: https://github.com/dlindahl/omniauth-cas 
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

end

