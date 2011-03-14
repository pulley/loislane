$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require 'rvm/capistrano'
set :rvm_type, :user
set :rvm_ruby_string, 'ree-1.8.7-2011.03@loislane'

set :deploy_via, :copy

default_run_options[:pty] = true  # Must be set for the password prompt from git to work

set :application, "loislane"
set :repository, "git@github.com:tonycoco/#{application}.git"
set :scm, "git"
set :branch, "master"
set :user, "tribunedev"
set :runner, user
set :use_sudo, false
set :deploy_to, "/Users/#{user}/Sites/#{application}"

role :web, "xserve.tii.trb"                          # Your HTTP server, Apache/etc
role :app, "xserve.tii.trb"                          # This may be the same as your `Web` server
role :db,  "xserve.tii.trb", :primary => true        # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end

  task :symlink_shared do
    run "ln -snf #{shared_path}/configs/ldap.rb #{release_path}/config/initializers"
    run "ln -snf #{shared_path}/uploads #{release_path}/public/uploads"
    run "cd #{release_path} && bundle install --quiet --without development test"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
