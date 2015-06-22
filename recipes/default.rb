#
# Cookbook Name:: cli-application
# Recipe:: default
#
# Copyright (c) 2015 Carnegie Learning, Inc., All Rights Reserved.

include_recipe 'cli-application::setup'
include_recipe 'cli-application::configure'
include_recipe 'cli-application::deploy'
