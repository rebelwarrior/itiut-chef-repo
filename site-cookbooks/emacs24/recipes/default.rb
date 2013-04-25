#
# Cookbook Name:: emacs24
# Recipe:: default
#

include_recipe "apt"

apt_repository "emacs" do
  uri "http://ppa.launchpad.net/cassou/emacs/ubuntu"
  distribution node["lsb"]["codename"]
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "CEC45805"
end

package "emacs24" do
  action :install
end
