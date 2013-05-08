#
# Cookbook Name:: google-chrome
# Recipe:: default
#

include_recipe "apt"

apt_repository "google-chrome" do
  uri "http://dl.google.com/linux/chrome/deb"
  distribution "stable"
  components ["main"]
  key "https://dl-ssl.google.com/linux/linux_signing_key.pub"
end

#package "google-chrome-stable" do
#  action :install
#end
