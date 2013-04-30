#
# Cookbook Name:: purge-packages
# Recipe:: default
#

%w{
  brasero-common
  empathy-common
  gnome-contacts
  rhythmbox
  thunderbird
  ubuntuone-client
  unity-lens-shopping
  unity-webapps-service
}.each do |pkg|
  package pkg do
    action :purge
  end
end
