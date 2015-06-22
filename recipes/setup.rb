#
# Cookbook Name:: cli-application
# Recipe:: setup
#
# Copyright (c) 2015 Carnegie Learning, Inc., All Rights Reserved.
#
# This recipe is run on a new server when it comes online

include_recipe 'apache2'

if platform?('ubuntu') && node[:platform_version].to_f >= 14.04
  conf_dir = node[:apache][:conf_available_dir]
else
  conf_dir = "#{node[:apache][:dir]}/conf.d"
end

%w{cors expires headers logging mime msie status}.each do |config|
  template "#{conf_dir}/#{config}.conf" do
    source   "apache_#{config}.conf.erb"
    owner    'root'
    group    'root'
    mode     0644
    notifies :run, resources(:bash => 'logdir_existence_and_restart_apache2') unless platform?('ubuntu') && node[:platform_version].to_f >= 14.04
  end

  if platform?('ubuntu') && node[:platform_version].to_f >= 14.04
    execute    "enable config #{config}" do
      command  "/usr/sbin/a2enconf #{config}"
      user     'root'
      notifies :run, resources(:bash => 'logdir_existence_and_restart_apache2')
    end
  end
end

include_recipe 'apache2::mod_php5'
