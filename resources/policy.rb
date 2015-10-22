#
# Cookbook Name:: apparmor
# Resource:: policy
#
# Copyright 2015, Chef Software, Inc.
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
#

property :name, kind_of: String, name_attribute: true
property :source_cookbook, kind_of: String
property :source_filename, kind_of: String

action :add do
  cookbook_file "/etc/apparmor.d/#{new_resource.name}" do
    cookbook new_resource.source_cookbook if new_resource.source_cookbook
    source new_resource.source_filename if new_resource.source_filename
    owner 'root'
    group 'root'
    mode '0644'
    notifies :reload, 'service[apparmor]', :immediately
  end

  service 'apparmor' do
    supports status: true, restart: true, reload: true
    action [:nothing]
  end
end

action :remove do
  file "/etc/apparmor.d/#{new_resource.name}" do
    action :delete
    notifies :reload, 'service[apparmor]', :immediately
  end

  service 'apparmor' do
    supports status: true, restart: true, reload: true
    action [:nothing]
  end
end
