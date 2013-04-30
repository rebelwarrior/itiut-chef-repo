#
# Cookbook Name:: purge-packages
# Recipe:: default
#

%w{
  brasero-common
  empathy-common
  gnome-contacts
  libaccount-plugin-1.0-0
  rhythmbox
  thunderbird
  ubuntuone-client
  unity-lens-shopping
  unity-webapps-common
  xul-ext-websites-integration
}.each do |pkg|
  package pkg do
    action :purge
  end
end
