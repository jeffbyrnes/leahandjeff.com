# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'my_app_name'
set :repo_url, 'git@bitbucket.org:jeffbyrnes/thejeffbyrnes.com.git'

set :deploy_to, "/srv/#{fetch(:application)}"

server 'thejeffbyrnes.com', user: 'deploy', roles: %w{web app}
