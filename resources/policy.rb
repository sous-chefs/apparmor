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

actions :add, :remove
default_action :add

attribute :name, kind_of: String, name_attribute: true
attribute :source_cookbook, kind_of: String
attribute :source_filename, kind_of: String
