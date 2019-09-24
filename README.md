# README

git clone git@github.com:Anoop1989/sample_oauth2.git

cd sample_oauth2
rvm list
rvm gemset list

bundle install
rake db:create db:migrate db:seed

rails s -p 3005

# Get details of a user
curl \
  -X GET \
  -H "Authorization: Bearer <access_token>"  \
  -H "Content-Type: application/json" \
  http://localhost:3005/users.json

# Generating access token
curl \
  -H "Content-Type: application/json" \
  -d '{"client_id": "<client_id>", "client_secret": "<client_secret>", "redirect_uri": "urn:ietf:wg:oauth:2.0:oob", "grant_type": "authorization_code", "code": "<auth_code>" }' \
  -X POST http://localhost:3005/oauth/token

# Generating access token using refresh token
curl \
  -H "Content-Type: application/json" \
  -d '{"client_id": "<client_id>", "client_secret": "<client_secret>", "redirect_uri": "urn:ietf:wg:oauth:2.0:oob", "grant_type": "refresh_token", "refresh_token": "<refresh_token>" }' \
  -X POST http://localhost:3005/oauth/token
