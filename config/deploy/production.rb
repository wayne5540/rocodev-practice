# -*- encoding : utf-8 -*-
require 'rvm/capistrano'
require "delayed/recipes"

default_environment["PATH"] = "/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin"

set :application, "my_project"
set :repository,  "git@github.com:wayne5540/rocodev-practice.git"
set :deploy_to, "/home/rocodev/my_project"

set :branch, "master"
set :scm, :git

set :user, "rocodev"
set :group, "rocodev"

set :deploy_to, "/home/rocodev/#{application}"
set :runner, "rocodev"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1

set :use_sudo, false
set :rvm_ruby_string, '2.0.0'

role :web, "106.186.30.53"                          # Your HTTP server, Apache/etc
role :app, "106.186.30.53"                         # This may be the same as your `Web` server
role :db,  "106.186.30.53"   , :primary => true # This is where Rails migrations will run

set :deploy_env, "production"
set :rails_env, "production"
set :scm_verbose, true
set :use_sudo, false

set :delayed_job_command, "bin/delayed_job"


namespace :deploy do

  desc "Restart passenger process"
  task :restart, :roles => [:web], :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

end


namespace :my_tasks do
  task :symlink, :roles => [:web] do
    run "mkdir -p #{deploy_to}/shared/log"
    run "mkdir -p #{deploy_to}/shared/pids"

    symlink_hash = {
      "#{shared_path}/config/database.yml"   => "#{release_path}/config/database.yml",
      "#{shared_path}/config/config.yml"   => "#{release_path}/config/config.yml",
    }

    symlink_hash.each do |source, target|
      run "ln -sf #{source} #{target}"
    end
  end

end
namespace :delayed_job do

  desc "Delayed_job start"
  task :start do
    run "RAILS_ENV=#{rails_env} bin/delayed_job start"
  end

  desc "Delayed_job stop"
  task :stop do
    run "RAILS_ENV=#{rails_env} bin/delayed_job stop"
  end

  desc "Delayed_job restart"
  task :restart do
    run "RAILS_ENV=#{rails_env} bin/delayed_job restart"
  end
end


namespace :remote_rake do
  desc "Run a task on remote servers, ex: cap staging rake:invoke task=cache:clear"
  task :invoke do
    run "cd #{deploy_to}/current; RAILS_ENV=#{rails_env} bundle exec rake #{ENV['task']}"
  end
end

after "deploy:finalize_update", "my_tasks:symlink"
after "deploy:stop",    "delayed_job:stop"
after "deploy:start",   "delayed_job:start"
after "deploy:restart", "delayed_job:restart"


