# frozen_string_literal: true

name              'apparmor'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Provides apparmor_service and apparmor_policy resources'
version           '4.1.13'
source_url        'https://github.com/sous-chefs/apparmor'
issues_url        'https://github.com/sous-chefs/apparmor/issues'
chef_version      '>= 15.3'

supports 'debian'
supports 'ubuntu'
