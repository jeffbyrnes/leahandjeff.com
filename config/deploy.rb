# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'jeffandleahswedding.com'
set :repo_url, "git@bitbucket.org:jeffbyrnes/#{fetch(:application)}.git"

set :deploy_to, "/srv/#{fetch(:application)}"

server "#{fetch(:application)}", user: 'deploy', roles: %w{web app}
