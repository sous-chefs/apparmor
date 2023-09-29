# apparmor Cookbook CHANGELOG

This file is used to list changes made in each version of the apparmor cookbook.

## 4.1.10 - *2023-09-29*

## 4.1.9 - *2023-07-10*

## 4.1.8 - *2023-05-17*

## 4.1.7 - *2023-05-03*

## 4.1.6 - *2023-03-02*

- Fix yaml

## 4.1.5 - *2023-03-01*

- Update workflows to 2.0.1
- Remove mdl and replace with markdownlint-cli2

## 4.1.4 - *2023-02-14*

## 4.1.3 - *2023-02-14*

## 4.1.2 - *2023-02-13*

## 4.1.1 - *2023-02-13*

- Remove delivery folder

## 4.1.0 - *2021-09-16*

- Fix issues when running in a docker container
- Fix disabling apparmor on Ubuntu 18.04
- Set `delay_mins` to 1 to help with CI problems

## 4.0.0 - *2021-09-15*

- Sous Chef Adoption
- Enable `unified_mode` and require Chef 15.3 or later
- Add `node['apparmor']['automatic_reboot']` attribute which is set to false by default to allow for automatic rebooting after enabling or disabling AppArmor.
- Add grub config to set `apparmor=0` when being disabled
- Run `aa-remove-unknown` when removing a policy so that it gets properly removed
- Add Debian testing

## 3.1.0 (2019-08-05)

- Remove ChefSpec matchers which are no longer necessary - [@tas50](https://github.com/tas50)
- Test Ubuntu 18.04 - [@tas50](https://github.com/tas50)
- Require Chef 12.7 or later - [@tas50](https://github.com/tas50)
- Remove EOL Ubuntu 14.04 testing - [@tas50](https://github.com/tas50)
- fix failures when removing apparmor on Ubuntu 18.04
- Remove respond_to in the metaadata - [@tas50](https://github.com/tas50)
- Modernize testing setup - [@tas50](https://github.com/tas50)

## 3.0.2 (2017-11-14)

- Resolve FC108 warning

## 3.0.1 (2017-08-17)

- Test with local delivery and not Rake
- Update apache2 license string to be a SPDX compliant string
- Resolve Chef 14 deprecation warnings
- Move maintainer information into the readme
- Convert tests to InSpec and use dokken images in Travis

## 3.0.0 (2017-02-14)

- Require Chef 12.5 and remove compat_resource
- Added integration testing in Travis CI

## 2.0.3 (2016-12-22)

- Remove Gemfile.lock file
- Depend on the latest compat_resource
- Add ChefSpec matchers
- Cookstyle and copyright header updates

## 2.0.2 (2016-09-15)

- Disable FC016
- Format markdown and clarify that we require Chef 12.1
- Add chef_version metadata and remove chef 11 compat code
- Depend on compat_resource 12.14+

## v2.0.1 (2015-11-10)

- Fix usage of variables in the custom resource

## v2.0.0 (2015-10-22)

- Converted the LWRP to a 12.5 custom resource with 12.X compatibility provided by compat_resource. This cookbook now requires Chef 12
- Updated Travis to use kitchen-docker for full integration tests and chefdk for lint/unit testing
- Added the Chef standard rubocop config
- Updated development dependencies in the Gemfile
- Fixed the integration test policy to sucessfully parse

## v1.0.0 (2015-09-23)

WARNING: This is a breaking release that includes a refactor of the default behavior and the inclusion of a LWRP

- Default behavior is now to install and enable AppArmor instead of disable / remove
- Added new LWRP for managing AppArmor policies. See the Readme for usage.
- Added bats tests in Test Kitchen

## v0.9.4 (2015-09-11)

- Updated Kitchen CI config for the latest format and platforms
- Updated Travis testing to include modern ruby releases
- Added basic cookbook convergence Chefspec
- Updated Berksfile to 3.0 format and remove apt/yum dependencies
- Updated Opscode -> Chef Software Inc.
- Updated Contributing and Testing documentation
- Updated development dependencies in the Gemfile
- Added a maintainers file and a Rake task for generating the md file from a toml file
- Migrated from opscode-cookbooks to chef-cookbooks
- Add cookbook release badge to the readme
- Set the minimum supported Chef release to 11
- Add a Rakefile for simplified testing
- Moved attributes/apparmor.rb to attributes/default.rb
- Added a chefignore file
- Added long_description, source_url and issues_url metadata

## v0.9.2

### Bug

- **[COOK-378](https://tickets.chef.io/browse/COOK-378)** - Fix an issue where apparmor cannot be stopped by the service on Ubuntu 9.10+

## v0.9.0

- First public release
