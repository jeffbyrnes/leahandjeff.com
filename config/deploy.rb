# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'jeffandleahswedding.com'
set :repo_url, "git@bitbucket.org:jeffbyrnes/#{fetch(:application)}.git"

set :deploy_to, "/srv/#{fetch(:application)}"

server "#{fetch(:application)}", user: 'deploy', roles: %w{web app}

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{public/_cache public/logs}
