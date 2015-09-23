apparmor Cookbook CHANGELOG
=======================
This file is used to list changes made in each version of the apparmor cookbook.

v1.0.0 (2015-09-23)
-------------------
WARNING: This is a breaking release that includes a refactor of the default behavior and the inclusion of a LWRP
- Default behavior is now to install and enable AppArmor instead of disable / remove
- Added new LWRP for managing AppArmor policies.  See the Readme for usage.
- Added bats tests in Test Kitchen

v0.9.4 (2015-09-11)
-------------------
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

v0.9.2
------
### Bug
- **[COOK-378](https://tickets.chef.io/browse/COOK-378)** - Fix an issue where apparmor cannot be stopped by the service on Ubuntu 9.10+

v0.9.0
------
- First public release
