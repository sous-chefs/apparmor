#
# Author:: Joshua Timberman (<joshua@chef.io>)
# Cookbook:: apparmor
# Recipe:: default
#
# Copyright:: 2009-2019, Chef Software, Inc.
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
  service_actions = node['apparmor']['disable'] ? [:stop, :disable] : [:start, :enable]
  file_action = node['apparmor']['disable'] ? :create : :delete
  line_action = node['apparmor']['disable'] ? :edit : :nothing

  Chef::Log.info "package_action: #{package_action.inspect}"

  execute 'apparmor_teardown' do
    command '/usr/sbin/service apparmor teardown'
    ignore_failure true
    only_if do
      package_action == :remove && ::File.exist?('/lib/apparmor/functions') && !docker?
    end
  end

  package 'apparmor' do
    action package_action
  end

  service 'apparmor' do
    action service_actions
    supports [:restart, :reload, :status]
  end

  file '/etc/default/grub.d/apparmor.cfg' do
    content 'GRUB_CMDLINE_LINUX_DEFAULT="$GRUB_CMDLINE_LINUX_DEFAULT apparmor=0"'
    action file_action
    notifies :run, 'execute[update-grub]'
    notifies :reboot_now, 'reboot[apparmor_state_change]' if node['apparmor']['automatic_reboot']
    not_if { docker? || !::Dir.exist?('/etc/default/grub.d') }
  end

  # Needed on older platforms that don't support /etc/default/grub.d
  append_if_no_line 'disable apparmor' do
    action line_action
    path '/etc/default/grub'
    line 'GRUB_CMDLINE_LINUX_DEFAULT="$GRUB_CMDLINE_LINUX_DEFAULT apparmor=0"'
    notifies :run, 'execute[update-grub]'
    notifies :reboot_now, 'reboot[apparmor_state_change]' if node['apparmor']['automatic_reboot']
    not_if { docker? || ::Dir.exist?('/etc/default/grub.d') }
  end

  execute 'update-grub' do
    action :nothing
  end

  reboot 'apparmor_state_change' do
    delay_mins 1
    reason 'Changing the AppArmor state requires a reboot'
    action :nothing
  end
end
