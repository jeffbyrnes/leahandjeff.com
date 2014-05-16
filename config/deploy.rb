# config valid only for Capistrano 3.2.1
lock '3.2.1'

set :application, 'leahandjeff.com'
set :repo_url, 'git@bitbucket.org:jeffbyrnes/leahandjeff.com.git'

set :deploy_to, "/var/www/#{fetch(:application)}"

server "#{fetch(:application)}", user: 'deploy', roles: %w(web app)

before 'deploy:finishing', 'grunt:default'
