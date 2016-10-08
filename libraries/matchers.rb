#
# Cookbook Name:: apparmor
# Library:: matchers
#
# Author:: Tim Smith (<tsmith@chef.io>)
#
# Copyright 2016, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if defined?(ChefSpec)
  #################
  # apparmor_policy
  #################
  ChefSpec.define_matcher :apparmor_policy

  def add_apparmor_policy(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apparmor_policy, :add, resource_name)
  end

  def remove_apparmor_policy(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apparmor_policy, :remove, resource_name)
  end
end
