name 'apparmor'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Disables apparmor service on Ubuntu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.3'
supports 'ubuntu'
depends 'compat_resource', '>= 12.16.3'

recipe 'apparmor::default', 'Disables apparmor service on Ubuntu'

source_url 'https://github.com/chef-cookbooks/apparmor'
issues_url 'https://github.com/chef-cookbooks/apparmor/issues'
chef_version '>= 12.1'
