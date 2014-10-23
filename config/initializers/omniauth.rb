Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flickr, 'yek', 'terces', scope: 'read'
end
