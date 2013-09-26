#
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Cookbook Name:: apparmor
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
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

if platform_family?('debian')
  package_action = node['apparmor']['disable'] ? :remove : :install
  Chef::Log.info "package_action: #{package_action.inspect}"

  package 'apparmor' do
    action package_action
  end

  actions = node['apparmor']['disable'] ? [:stop, :disable] : [:start, :enable]
  service 'apparmor' do
    action       actions
    supports     [:restart, :reload, :status]
    stop_command '/usr/sbin/service apparmor teardown'
  end
end
