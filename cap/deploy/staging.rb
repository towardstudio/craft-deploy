# Define roles, user and IP address of deployment server
role :app, %w{[user]@[IP]}
set :stage, :staging

server '[IP]', user: '[user]', roles: %w{app}

set :branch, "dev"
set :deploy_to, "/var/www/staging.domain.com/"