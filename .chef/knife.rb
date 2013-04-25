current_dir = File.dirname(__FILE__)

log_level                :info
log_location             STDOUT
node_name                'itiut'
client_key               '/home/itiut/itiut-chef-repo/.chef/itiut.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef/validation.pem'
chef_server_url          'http://localhost:4000'
syntax_check_cache_path  '/home/itiut/itiut-chef-repo/.chef/syntax_check_cache'

cookbook_path [ 
  "#{current_dir}/../cookbooks",
  "#{current_dir}/../site-cookbooks"
]
role_path "#{current_dir}/../roles"
data_bag_path "#{current_dir}/../data_bags"
