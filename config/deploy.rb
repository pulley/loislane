require 'bundler/capistrano'

default_run_options[:pty] = true  # Must be set for the password prompt from git to work

set :application, "loislane"
set :repository, "git@github.com:tonycoco/#{application}.git"
set :scm, "git"
set :branch, "master"
set :user, "tribunedev"
set :runner, user
set :use_sudo, false
set :deploy_to, "/Users/#{user}/Sites/#{application}"

set :bundle_cmd, "/Users/#{user}/.rvm/gems/ree-1.8.7-2010.02/bin/bundle"
set :bundle_without, [:development, :test]

role :web, "xserve.tii.trb"                          # Your HTTP server, Apache/etc
role :app, "xserve.tii.trb"                          # This may be the same as your `Web` server
role :db,  "xserve.tii.trb", :primary => true        # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
