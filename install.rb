#!/usr/bin/env ruby

require 'fileutils'

def run(cmd)
  puts cmd
  system cmd
end

def create_link(source, destiny)
  run "ln -nsf #{source} #{destiny}"
end

# Link dependencies to workspace
default_workspace = File.join(Dir.home, "workspace")
puts "Enter your workspace folder (default: #{default_workspace})"
workspace = gets.strip
workspace = default_workspace if workspace.empty?
`echo 'export WORKSPACE=#{workspace}' >> ~/.env`

FileUtils.mkdir_p workspace
Dir['dependencies/*'].each do |dependency|
  source  = File.expand_path(dependency)
  destiny = File.join(workspace, dependency.sub('dependencies/', ''))

  create_link source, destiny
end

# Link config files to XDG_CONFIG_HOME
config_dir = ENV['XDG_CONFIG_HOME'] || File.join(Dir.home, ".config")

FileUtils.mkdir_p config_dir
Dir['config/*'].each do |config|
  source  = File.expand_path(config)
  destiny = File.join(config_dir, config.sub('config/', ''))

  create_link source, destiny
end

# Link files to user's .local
local_dir = File.join(Dir.home, ".local")

FileUtils.mkdir_p local_dir
Dir['local/*'].each do |file|
  source  = File.expand_path(file)
  destiny = File.join(local_dir, file.sub('local/', ''))

  create_link source, destiny
end

# Copy dotfiles
Dir['*'].each do |file|
  next if file =~ /TODO|README|install|dependencies|^config$|local/

  source  = File.expand_path(file)
  destiny = File.join(Dir.home, ".#{file}")

  create_link source, destiny
end

# Add config env vars
#export SSH_AUTH_SOCK="/run/user/$(id -u $(whoami))/keyring/ssh"

# Install dependencies
puts "Install python and pip (sudo apt-get install python-dev python-pip)"
puts %Q{Install powerline as dev dependency (pip install --user -e #{workspace}/powerline)}
