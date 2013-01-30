require 'bundler/capistrano'

set :application, "bw_upload"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

role :app, "50.116.23.78"
role :web, "50.116.23.78"
role :db, "50.116.23.78", :primary => true

set :deploy_to, "/var/www/bw_send"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, "boondoc4@redmine.boondockstaging.com:/home8/boondoc4/www/git/bw_send.git"
set :branch, "master"

set :user, "bw_send"

after "deploy:update_code" do
  #run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  #run "ln -s #{shared_path}/1001303134.pem #{release_path}/config/1001303134.pem"
  #run "ln -s #{shared_path}/videos #{release_path}/public/videos"
  run "cd #{release_path} ; RAILS_ENV=production bundle exec rake assets:precompile --trace"
  # Fix group so cached javascripts and stylesheets can be generated
  #run "chgrp FBCS #{release_path}/public/javascripts"
  #run "chgrp FBCS #{release_path}/public/stylesheets"
end

namespace :deploy do
  task :start, :roles => :app do
    restart
  end
  
  task :restart, :roles => :app do
    run "touch #{File.join(current_path, "tmp", "restart.txt")}"
  end
end