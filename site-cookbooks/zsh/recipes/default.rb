#
# Cookbook Name:: zsh
# Recipe:: default
#

package "zsh" do
  action :install
end

package "autojump" do
  action :install
end

user node[:current_user] do
  action :manage
  shell "/bin/zsh"
end
