name 'apparmor'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Disables apparmor service on Ubuntu'
version '0.9.3'
supports 'ubuntu'
recipe 'apparmor::default', 'Disables apparmor service on Ubuntu'

source_url 'https://github.com/opscode-cookbooks/apparmor' if respond_to?(:source_url)
issues_url 'https://github.com/opscode-cookbooks/apparmor/issues' if respond_to?(:source_url)
