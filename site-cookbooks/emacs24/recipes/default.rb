#
# Cookbook Name:: emacs24
# Recipe:: default
#

include_recipe "apt"

apt_repository "emacs" do
  uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
  distribution node[:lsb][:codename]
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "CEC45805"
end

package "emacs24" do
  action :install
end

app_dir = "#{ENV['HOME']}/.local/share/applications"

directory app_dir do
  owner node[:current_user]
  group node[:current_user]
  mode 0755
  action :create
end

setup_sh = "setup_desktop_file.sh"

cookbook_file "#{app_dir}/#{setup_sh}" do
  owner node[:current_user]
  group node[:current_user]
  mode 0755
end

bash "sh #{setup_sh}" do
  user node[:current_user]
  group node[:current_user]
  cwd app_dir
  code "sh #{setup_sh}"
end
