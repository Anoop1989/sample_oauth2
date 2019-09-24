# README

# Basic setup
git clone git@github.com:Anoop1989/sample_oauth2.git

cd sample_oauth2

Ensure you have gemset pointing appropriately using following commands (use pulse360 gemset if already exist)

-> rvm list

-> rvm gemset list

bundle install

rake db:create db:migrate db:seed

rails s -p 3005

# Get details of a user
curl -X GET -H "Authorization: Bearer <access_token>" -H "Content-Type: application/json" http://localhost:3005/users.json

# Authorize application
http://localhost:3005/oauth/authorize?client_id=<client_id>&redirect_uri=https%3A%2F%2Fwww.google.com&response_type=code&scope=read%2C+write

# Generating access token
curl -H "Content-Type: application/json" -d '{"client_id": "<client_id>", "client_secret": "<client_secret>", "redirect_uri": "https://www.google.com", "grant_type": "authorization_code", "code": "<auth_code>" }' -X POST http://localhost:3005/oauth/token

# Generating access token using refresh token
curl -H "Content-Type: application/json" -d '{"client_id": "<client_id>", "client_secret": "<client_secret>", "redirect_uri": "https://www.google.com", "grant_type": "refresh_token", "refresh_token": "<refresh_token>" }' -X POST http://localhost:3005/oauth/token
