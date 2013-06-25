my ubuntu settings
====

installation
----
### update packages
~~~
$ sudo apt-get update
$ sudo apt-get upgrade
~~~

### change system settings
- appearance
 - look -> launcher icon size 32
 - behavior -> enable workspaces ON
- keyboard layout -> options
 - ctrl key position -> caps lock as ctrl
 - key sequence to kill the X server ON
- language support
 - install languages... -> japanese
 - keyboard input method system -> ibus
- privacy
 - search results -> include online search results OFF
- time & date
 - clock -> weekday, date and month, 24-hour time ON

### install guest additions (for virtualbox)
[device] -> [install Guest Additions...], and restart

### install vmware tools (for vmware)
mount vmware tools, and ...
~~~
$ tar xvf /media/itiut/VMware\ Tools\VMwareTools-xxx.tar.gz
$ cd vmware-tools-distrib
$ sudo ./vmware-install.pl
~~~

### install rbenv and ruby-build
~~~
$ sudo apt-get install git build-essential libreadline-dev libssl-dev
$ git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
$ git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
$ echo 'eval "$(rbenv init -)"' >> ~/.profile
$ exec $SHELL -l
$ rbenv install 2.0.0-p0
$ rbenv rehash
$ rbenv global 2.0.0-p0
~~~

### install bundler via gem
~~~
$ gem update --system
$ gem install bundler
$ rbenv rehash
~~~

### enable ssh to localhost
~~~
$ sudo apt-get install openssh-server
$ ssh-keygen -t rsa
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
~~~

### clone chef repository and bundle install
install libxslt-dev and libxml2-dev for Nokogiri
~~~
$ sudo apt-get install libxslt-dev libxml2-dev
~~~
~~~
$ git clone git@github.com:itiut/itiut-chef-repo.git
$ cd itiut-chef-repo
$ bundle install --path vendor/bundle
~~~

### download cookbooks via berkshelf
~~~
$ bundle exec berks install --path cookbooks
~~~

### run knife solo
~~~
$ bundle exec knife solo prepare localhost
$ bundle exec knife solo cook localhost
~~~

----

log
----
~~~
$ mkdir itiut-chef-repo
$ cd itiut-chef-repo
$ bundle init
$ cat <<EOF >> ./Gemfile
gem "chef"
gem "knife-solo", "~>0.3.0.pre3"
gem "berkshelf"
EOF
$ bundle install --path vendor/bundle
$ bundle exec knife solo init .
$ git init
$ cat << EOF >> .gitignore
.*
Gemfile.lock
Berksfile.lock
.bundle/
vendor/
cookbooks/*
!.gitignore
!.gitkeep
EOF
$ git add .
$ git commit -m "knife solo init"

$ sudo apt-get install openssh-server
$ ssh-keygen -t rsa
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

$ bundle exec knife solo prepare localhost
$ bundle exec berks init .
$ rm Vagrantfile
$ git add .
$ git commit -m "berks init"

$ vi .chef/knife.rb
current_dir = File.dirname(__FILE__)
cookbook_path [ 
  "#{current_dir}/../cookbooks",
  "#{current_dir}/../site-cookbooks"
]
role_path "#{current_dir}/../roles"
data_bag_path "#{current_dir}/../data_bags"

$ bundle exec knife solo cook localhost

$ vi Berksfile
$ bundle exec berks install --path cookbooks
~~~
