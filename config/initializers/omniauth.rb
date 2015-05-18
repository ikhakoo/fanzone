Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '806991584178-pri7ho8tprgkjp9vhl01dmui4mgdg1j1.apps.googleusercontent.com', 'BKMqA4q71kuegzXimt0qOawL', scope: 'userinfo.profile,youtube'
end