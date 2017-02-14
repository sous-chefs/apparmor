name 'apparmor'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Disables apparmor service on Ubuntu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.3'
supports 'ubuntu'

recipe 'apparmor::default', 'Disables apparmor service on Ubuntu'

source_url 'https://github.com/chef-cookbooks/apparmor'
issues_url 'https://github.com/chef-cookbooks/apparmor/issues'
chef_version '>= 12.5' if respond_to?(:chef_version)
