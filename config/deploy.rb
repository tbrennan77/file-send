require 'bundler/capistrano'

set :application, "bw_send"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

role :app, "74.220.218.124"
role :web, "74.220.218.124"
role :db, "74.220.218.124", :primary => true

set :deploy_to, "/home8/boondoc4/rails_apps/bw_send"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, :git
set :repository, "ssh://boondoc4@redmine.boondockstaging.com/home8/boondoc4/www/git/bw_send.git"
set :branch, "master"

set :user, "boondoc4"

after "deploy:update_code" do
  #run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
  #run "rm -rf /home8/boondoc4/public_html/pipeline_cms/"
  run "ln -s #{release_path}/public /home8/boondoc4/public_html/bw_send"
  #run "ln -s #{shared_path}/index.html ~/public_html/pipeline_cms/index.html"
  #run "cd #{release_path} ; RAILS_ENV=production bundle exec rake assets:precompile --trace"
end

namespace :deploy do
  task :start, :roles => :app do
    restart
  end
  
  task :restart, :roles => :app do
    run "touch #{File.join(current_path, "tmp", "restart.txt")}"
  end
end