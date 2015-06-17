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

# unzip the ChromeDriver Bundle
windows_zipfile chefPath.to_s do
  source "http://chromedriver.storage.googleapis.com/2.15/#{zipFile}"
  action :unzip
  
  not_if { chefPath.join( "chromedriver.exe" ).exist?() }
end

windows_path chefPath.to_s do
  action :add
end