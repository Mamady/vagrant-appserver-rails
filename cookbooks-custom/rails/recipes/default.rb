include_recipe "nginx"
include_recipe "unicorn"

package "libsqlite3-dev"

gem_package "bundler"

common = {:name => "forouzani", :app_root => "/apps/forouzani"}

directory common[:app_root] do
  owner "vagrant"
  recursive true
end

directory common[:app_root]+"/shared" do
  owner "vagrant"
end

%w(config log tmp sockets pids).each do |dir|
  directory "#{common[:app_root]}/shared/#{dir}" do
    owner "vagrant"
    recursive true
    mode 0755
  end
end

template "#{node[:unicorn][:config_path]}/#{common[:name]}.conf.rb" do
  mode 0644
  source "unicorn.conf.erb"
  variables common
end

nginx_config_path = "/etc/nginx/sites-available/#{common[:name]}.conf"

template nginx_config_path do
  mode 0644
  source "nginx.conf.erb"
  variables common.merge(:server_names => "forouzani.test")
  notifies :reload, "service[nginx]"
end

nginx_site "forouzani" do
  config_path nginx_config_path
  action :enable
end
