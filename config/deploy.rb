require 'bundler/capistrano'

set :application, "bw_upload"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

role :app, "boondockwalkerstaging.com"
role :web, "boondockwalkerstaging.com"
role :db, "boondockwalkerstaging.com", :primary => true

set :deploy_to, "/home6/boondoc7/rails_apps/bw_send"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, "git@git.boondockwalker.com:boondock/file-sharing.git"
set :branch, "master"

set :user, "boondoc7"

after "deploy:update_code" do
  run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  run "ln -s #{release_path}/public /home6/boondoc7/public_html/send"
  run "cd #{release_path} ; RAILS_ENV=production bundle exec rake assets:precompile --trace"
end



namespace :deploy do
  task :start, :roles => :app do
    restart
  end
  
  task :restart, :roles => :app do
    run "touch #{File.join(current_path, "tmp", "restart.txt")}"
  end
end