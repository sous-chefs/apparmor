#apparmor Cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/apparmor.svg?branch=master)](http://travis-ci.org/chef-cookbooks/apparmor)
[![Cookbook Version](https://img.shields.io/cookbook/v/apparmor.svg)](https://supermarket.chef.io/cookbooks/apparmor)

Default recipe installs and manages AppArmor service, or disables and removes AppArmor depending on `default['apparmor']['disable']` attribute.  Also includes a custom resource (LWRP) for managing AppArmor policies.

##Requirements
#### Platforms
- Ubuntu
- Debian

#### Chef
- Chef 11+

#### Cookbooks
- none

## Attributes
- `default['apparmor']['disable']`: Controls installing or removing apparmor service in the `default.rb` recipe.  Defaults to false which installs apparmor, starts the service, and enables the service.

##Recipes
### default.rb
This recipe either installs or removes the apparmor package and starts / enables the service depending on the state of `default['apparmor']['disable']`.

##Resource/Provider
###Policy
Adds or removes Apparmor policies
#### Actions
- :add: Adds a new Apparmor policy using a provided policy file
- :remove: Removes a specified Apparmor policy

#### Attribute Parameters
- :name: Name attribute. The name of the policy as stored in /etc/apparmor.d/.
- :source_cookbook: Cookbook to source the policy file from if the provider is not in the same cookbook.
- :source_filename: Name of the source file in the cookbook if it doesn't match the name attribute.

#### Examples
Add the policy my_super_app where a cookbook file exists in the same cookbook and is named my_super_app

```ruby
apparmor_policy 'my_super_app'
```

Add the policy my_super_app where a cookbook file exists in a different cookbook and the file is named my_super_app_am_policy

```ruby
apparmor_policy 'my_super_app' do
  source_cookbook 'acme_apparmor_profiles'
  source_filename 'my_super_app_am_policy'
end
```

Remove the policy my_super_app

```ruby
apparmor_policy 'my_super_app' do
  action  :remove
end
```

##License & Authors

**Author:** Cookbook Engineering Team (<cookbooks@chef.io>)

**Copyright:** 2009-2015, Chef Software, Inc.
```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
