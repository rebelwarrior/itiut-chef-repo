#
# Cookbook Name:: heroku-toolbelt
# Recipe:: default
#

execute "install heroku toolbelt" do
  command "wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh"
  action :run
  not_if "which heroku"
end
