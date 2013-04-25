current_dir = File.dirname(__FILE__)

log_level                :info
log_location             STDOUT
node_name                'itiut'
chef_server_url          'http://localhost:4000'

cookbook_path [ 
  "#{current_dir}/../cookbooks",
  "#{current_dir}/../site-cookbooks"
]
role_path "#{current_dir}/../roles"
data_bag_path "#{current_dir}/../data_bags"
