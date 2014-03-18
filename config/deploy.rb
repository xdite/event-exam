require 'bundler/capistrano'
# require 'hoptoad_notifier/capistrano'

set :application, "shenyun_crm"
default_run_options[:pty] = true
set :branch, "master"
set :repository,  "git@bitbucket.org:shanhuo/shenyun_crm.git"
set :scm, "git"
set :user, "deploy" # 一個伺服器上的帳戶用來放你的應用程式，不需要有sudo權限，但是需要有權限可以讀取Git repository拿到原始碼
set :scm_passphrase, ""
#set :port, "22"

set :deploy_to, "/home/deploy/shenyun_crm"
set :deploy_via, :remote_cache
set :use_sudo, false
set :git_shallow_clone, 1
set :git_enable_submodules, 1

role :web, "106.187.90.81"
role :app, "106.187.90.81"
role :db,  "106.187.90.81", :primary => true


namespace :deploy do

  task :copy_config_files, :roles => [:app] do
    db_config = "#{shared_path}/database.yml"
    application_config = "#{shared_path}/application.yml"
    run "cp #{db_config} #{release_path}/config/database.yml"
    run "cp #{application_config} #{release_path}/config/application.yml"
  end

  task :update_symlink do
    run "rm #{current_path}/public/system"
    run "ln -s #{shared_path}/public/system #{current_path}/public/system"
  end

  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end


after "deploy:update_code", "deploy:copy_config_files" # 如果將database.yml放在shared下，請打開
after "deploy:finalize_update", "deploy:update_symlink" # 如果有實作使用者上傳檔案到public/system，請打開

