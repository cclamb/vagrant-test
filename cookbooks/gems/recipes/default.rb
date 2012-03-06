#
# Author:: Chris Lamb <chrislambistan@gmail.com>
# Cookbook Name:: gems
# Recipe:: default
#
# Copyright 2009-2010, Opscode, Inc.
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

proxy = node[:proxy][:http]
gems = node[:gems]

gems.each do |gem_name|
  base_cmd = "gem install #{gem_name}"
  command = proxy == nil ? base_cmd : "#{base_cmd} --http-proxy #{proxy}"
  execute command do
    not_if "gem list | grep #{gem_name}"
  end
end unless gems == nil
