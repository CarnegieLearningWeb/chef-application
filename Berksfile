source "https://supermarket.chef.io"

def cli_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook "cli-#{name}", version, { git: "git@bitbucket.org:carnegielearning-cookbooks/#{name}.git" }.merge(options)
end

def cli_legacy_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook name, version, { github: 'carnegielearningweb/chef-cookbooks', branch: '2.x', rel: name }.merge(options)
end

def opsworks_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook name, version, { github: 'aws/opsworks-cookbooks', branch: 'release-chef-11.10', rel: name }.merge(options)
end

metadata

cookbook 'apt'
opsworks_cookbook 'apache2'
