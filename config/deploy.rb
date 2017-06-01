# config valid only for current version of Capistrano
lock "3.8.1"


set :application, "dnd_tools"
set :repo_url, "git@github.com:mmitrovich/dnd_tools.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true
set :user, "mike"

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
	desc "Symlink shared config files"
	task :symlink_config_files do
		on roles(:all) do
	    	execute "ln -s #{ deploy_to }/shared/config/local_env.yml #{ current_path }/config/local_env.yml"
	    end
	end

	desc "Restart Passenger app"
	task :restart do
		on roles(:all) do
	    	execute "touch #{ File.join(current_path, 'tmp', 'restart.txt') }"
	    end
	end
end




after "deploy", "deploy:symlink_config_files"
after "deploy", "deploy:restart"
after "deploy", "deploy:cleanup"
