#
# Cookbook Name:: selenium-chromedriver
# Recipe:: default
#
# Copyright 2014, Lonnie VanZandt
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

chef_gem "selenium-webdriver" 
chef_gem "chromedriver-helper"

chefPath = Pathname( "/opscode/chef/embedded/bin" ).realpath()
zipFile = "chromedriver_win32.zip"
tmpPath = Pathname( "/tmp" )
chromeZip = Pathname( tmpPath ).join( zipFile )

remote_file zipFile.to_s do
  action :create_if_missing
  notifies :run, 'execute[unzip ChromeDriver]'

  source "http://chromedriver.storage.googleapis.com/2.15/#{zipFile}"
  path chromeZip.to_s
end

# unzip the ChromeDriver Bundle

execute "unzip ChromeDriver" do
  action :nothing
  cwd chefPath.to_s
 
  command "C:\Program Files\7-Zip\7z.exe -y #{chromeZip}"
  only_if { chromeZip.exist?() }
end
